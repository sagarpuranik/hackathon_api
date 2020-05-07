import { Component, ViewChild, ViewChildren, QueryList } from '@angular/core';
import { GetDataServiceService } from './services/get-data-service.service'
import {
  MatInputModule, MatPaginatorModule, MatProgressSpinnerModule,
  MatSortModule, MatTableModule, MatTableDataSource, MatSortHeader, MatCheckboxModule, MatLabel
} from '@angular/material';
import { SelectionModel } from '@angular/cdk/collections';
import { Subject } from 'rxjs'
import { takeUntil } from 'rxjs/operators'
import { MatPaginator } from '@angular/material/paginator';
import {MatIconModule} from '@angular/material/icon';
import { MatSelectChange } from '@angular/material/select';
import { MatSort } from '@angular/material/sort';
import { FormControl, Validators } from '@angular/forms';
import * as FileSaver from 'file-saver';
import * as XLSX from 'xlsx';
import * as Highcharts from 'highcharts';

export interface Data {
  ServerName: string,
  IP: string,
  Size: number
}

export interface QueryData {
  Name: string,
  FilePath: string,
  SizeInBytes_A: number,
  SizeInBytes_B: number,
  ScanStamp_A: string,
  ScanStamp_B: string
}

const EXCEL_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
const EXCEL_EXTENSION = '.xlsx';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {

  displayedColumns: string[] = ['select', 'ServerName', 'IP', 'Size'];
  displayedColumns1: string[] = ['Name', 'FilePath', 'SizeInBytes_A','SizeInBytes_B', 'ScanStamp_A','ScanStamp_B'];
  dataSrc: MatTableDataSource<Data>;
  queryDataSrc: MatTableDataSource<QueryData>[] = [];

  selection = new SelectionModel<Data>(true, []);
  options: Data[];
  selectedVal: '';
  arr1 = {};
  arr = [];
  grph_arr = [];
  grph_arr0 = [];
  grph_arr1 = [];
  bar_arr = [];
  bar_arr1 = [];
  serverControl = new FormControl('LT079861', [Validators.required]);
  datepicker = new FormControl(new Date(new Date().getFullYear(),new Date().getMonth(),new Date().getDate()),[Validators.required]);
  listarray: string[];
  val = false;
  worksheet = [];
  workbook = [];
  excelBuffer = [];
  server_max_size: any;
  value;
  minDate: Date;
  maxDate: Date;

   public scatter_options: any = {
    chart: {
      type: 'area',
      zoomType: 'xy',
      height: '100%'
      // height: 700
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat:  
        '<tr><td style="padding:0"><b>{ this.grph_arr1[0]}</b></td>'+
        '<td style="color:{series.color};padding:0">Size: </td>' +
                     '<td style="padding:0"><b>{point.y:.9f} MB</b></td></tr>',   
        footerFormat: '</table>',
        shared: true,
        useHTML: true
  },
  // plotOptions : {
  //   column: {
  //       dataLabels: {
  //           enabled: true,
  //           format: '{point.y:.2f}',
  //           style: {
  //               color: 'black'
  //           }
  //       },
  //   },
  // },
    boost: {
        useGPUTranslations: true,
        usePreAllocated: true
    },
    title: {
      text: 'File Changes In '+ this.serverControl.value + ' Server'
    },
    credits: {
      enabled: false
    },
    xAxis: {
      title: {
            text: 'List of Files/Directories changed'
        }
    },
      yAxis: {
        // Renders faster when we don't have to compute min and max
        min: 0,
        // max: 9999,
        minPadding: 0,
        maxPadding: 0,
        title: {
            text: 'Size (MB)'
        }
    },
    series: [
    {
      marker: {
        radius: 2.5
      },
      name:'Size of Files today',
      color: 'rgba(224, 194, 0, 0.90)',
      // color: 'rgba(54, 124, 43, 1)',
      data: this.grph_arr
        
    },{

      marker: {
        radius: 2.5
      },
      name:'Size of Files in Backup',
      color: 'rgba(54, 124, 43, 1)',
      data: this.grph_arr0

    }]

  };

 public radial_options: any =  {
 chart: {
        type: 'column'
        // width:'75%'
    }, 
    title: {
        text: 'Used Space in Servers'
    },
    xAxis: {
        categories:this.bar_arr,
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Size (GB)'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} GB</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Size',
        color: 'rgba(54, 124, 43, 1)',
        data: this.bar_arr1,
        shadow:true

    }]

};



  private paginator: QueryList<MatPaginator>;
  @ViewChildren(MatPaginator) set matPaginator(mp: QueryList<MatPaginator>) {
    this.paginator = mp;
    console.log(this.paginator);
    this.setDataSourceAttribute();
  }

  setDataSourceAttribute() {
    if (this.listarray.length) {
      for (var i = 0; i < this.listarray.length; i++) {
        this.queryDataSrc[i].paginator = this.paginator.toArray()[i];
      }
    }
  }

  constructor(
    private _service: GetDataServiceService
  ) { }

  ngOnInit() {
    let dte = this.set_graph_parm();
    console.log(dte);
    let day = dte.slice(-2);
    console.log('day'+day)
    let preday = parseInt(day) - 1;
    console.log('previous day'+preday)
    let predayformat = (preday.toString()).length < 2 ?  '0'+preday.toString() : preday.toString()
    console.log('format'+predayformat)
    let date = dte.slice(0,6) + predayformat; 
    console.log(date);
    const currentYear = new Date().getFullYear();
    this.minDate = new Date(currentYear, new Date().getMonth(), new Date().getDate()-60);
    this.maxDate = new Date(currentYear, new Date().getMonth(),(new Date().getDate()))

    this._service.getdata(this.serverControl.value, date).subscribe(res => {
      if(res){
          console.log(res);
        this.options = res[1];
        this.dataSrc = new MatTableDataSource(res[1]);
        this.server_max_size = this.options.sort(function (a, b) { return b.Size - a.Size })[1].Size;
        for (let i=0; i< res[0].length ; i++){
            // this.grph_arr.push([res[0][i].FilePath,parseInt(res[0][i].SizeInBytes_B)/1048576]);
            // this.grph_arr1.push(res[0][i].FilePath);
            
            this.grph_arr.push(parseInt(res[0][i].SizeInBytes_A)/1048576);
            this.grph_arr0.push(parseInt(res[0][i].SizeInBytes_B)/1048576);
            this.grph_arr1.push(res[0][i].FilePath);
          } console.log(this.grph_arr1);
          console.log(this.grph_arr1[0]);
          console.log(this.grph_arr0);
          console.log(this.grph_arr);
        for (let i=0; i< res[1].length ; i++){
            this.bar_arr.push([res[1][i].ServerName]);
            this.bar_arr1.push(parseInt(res[1][i].Size)/1073741824);
          }
        Highcharts.chart('scatter_charts', this.scatter_options);
        Highcharts.chart('radial_bar', this.radial_options);
        this.grph_arr.splice(0,this.grph_arr.length);
        this.grph_arr.splice(0,this.grph_arr0.length);
        this.grph_arr1.splice(0,this.grph_arr1.length);
      }
    })
    // this._service.getdata().subscribe(res => {
    //   if (res) {
    //     this.options = res;
    //     this.dataSrc = new MatTableDataSource(res);
    //     this.server_max_size = this.options.sort(function (a, b) { return b.Size - a.Size })[0].Size;        
    //   }
    // });
  }

  /** Whether the number of selected elements matches the total number of rows. */
  isAllSelected() {
    const numSelected = this.selection.selected.length;
    const numRows = this.dataSrc.data.length;
    if (this.serverControl.value)
      return numSelected === numRows - 1;
    else
      return numSelected === numRows;
  }

  masterToggle() {
    if (this.isAllSelected())
      this.selection.clear();
    else
      this.dataSrc.data.forEach(row => { if (row.ServerName != this.serverControl.value) this.selection.select(row); });
  }

  clearscreen() {
    this.dataSrc.data.forEach(row => { this.selection.deselect(row); });
  }

  checkboxLabel(row?: Data, index?: number): string {
    if (!row) {
      return `${this.isAllSelected() ? 'select' : 'deselect'} all`;
    }
    else {
      return `${this.selection.isSelected(row) ? 'deselect' : 'select'} row ${index + 1}`;
    }
  }

  checkIfSelected(row?: Data) {
    if (row.ServerName === this.serverControl.value )
      return true;
  }

  onSubmit() {
    let prog_bar = document.getElementById("progress_bar");
    prog_bar.classList.toggle("hide");
    this.queryDataSrc = [];
    this.dataSrc.data.forEach(row => {
      !this.checkIfSelected(row) ? (this.selection.isSelected(row) ? this.arr1[row.ServerName] = row.ServerName : delete this.arr1[row.ServerName]) : delete this.arr1[row.ServerName];
    });
    this.listarray = Object.values(this.arr1);
    
    this._service.getTable(this.serverControl.value, this.listarray).subscribe(res => {
      if (res) {
        prog_bar.classList.toggle("hide");
        if (this.listarray.length < 5) {
          for (let i = 0; i < this.listarray.length; i++) {
            this.value='ServerName '+this.listarray[i];
            this.queryDataSrc[i] = new MatTableDataSource(res[i]);
            this.queryDataSrc[i].paginator = this.paginator.toArray()[i];
            console.log(this.queryDataSrc[i]);
          }
        }
        else{
          prog_bar.classList.toggle("hide");
          this.exportTable();
          prog_bar.classList.toggle("hide");
        }
      }
    });
  }

  exportTable() {
    let sheet_dict = {};
    let sheetname = [];
    this._service.getTable(this.serverControl.value, this.listarray).subscribe(res => {
      if (res) {
        for (let i = 0; i < this.listarray.length; i++) {
          this.worksheet[i] = XLSX.utils.json_to_sheet(res[i]);
          sheet_dict[this.listarray[i]] = this.worksheet[i];
          sheetname.push(this.listarray[i]);
        }
        const workbook: XLSX.WorkBook = { Sheets: sheet_dict, SheetNames: sheetname };
        const excelBuffer: any = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
        this.saveAsExcelFile(excelBuffer, this.serverControl.value);
      }
    });
  }


  private saveAsExcelFile(buffer: any, fileName: string): void {
    const excelData: Blob = new Blob([buffer], {
      type: EXCEL_TYPE
    });
    FileSaver.saveAs(excelData, fileName + EXCEL_EXTENSION);
  }

  graph_update(parm: any) {
    let dte = this.set_graph_parm();
    this._service.getGraphdata(this.serverControl.value, dte).subscribe(res => {
      if(res){
        console.log("received response")
        console.log(res);
        console.log(this.serverControl.value);
        for (let i=0; i< res.length ; i++){
            // this.grph_arr.push([res[i].FilePath,parseInt(res[i].SizeInBytes_B)/1048576]);
            // this.grph_arr1.push(res[i].FilePath);
            this.grph_arr.push(parseInt(res[i].SizeInBytes_A)/1048576);
            this.grph_arr0.push(parseInt(res[i].SizeInBytes_B)/1048576);
            this.grph_arr1.push(res[i].FilePath);
            console.log(this.grph_arr);
            console.log(this.grph_arr0);
            console.log(this.grph_arr1);
          }
        this.scatter_options.title.text = 'File Changes In '+ this.serverControl.value + ' Server';
        Highcharts.chart('scatter_charts', this.scatter_options);
        this.grph_arr.splice(0,this.grph_arr.length);
        this.grph_arr.splice(0,this.grph_arr0.length);
        this.grph_arr1.splice(0,this.grph_arr1.length);
      }
    })
  }

  set_graph_parm(){

    let dt = ((this.datepicker.value).toLocaleDateString()).split('/');
    let dte = '';

    if ( (dt[1].toString()).length < 2 ){
      dt[1] = '0' + dt[1].toString();
    }
    if ( dt[0].length < 2 ){
      dt[0] = '0' + dt[0];
    }
     
    dte = dt[2]+dt[1]+dt[0];
    console.log(dte);

    return dte

  }

}






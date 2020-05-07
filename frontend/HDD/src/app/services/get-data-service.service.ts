import { Injectable } from '@angular/core';
import { Subject} from 'rxjs';
import { HttpClient } from '@angular/common/http';
@Injectable()
export class GetDataServiceService {
subject = new Subject();
  constructor(private _httpClient: HttpClient) { }

  getdata(serverName:string,comp_date:string){
    return this._httpClient.get<any>("http://localhost:3000/getdata?serverName="+serverName+"&comp_date="+comp_date);
  }

  getTable(serverName:string, list : any){
    return this._httpClient.post<any>("http://localhost:3000/gettable",{serverName,list});
  }

  getGraphdata(serverName:string,comp_date:string){
    return this._httpClient.get<any>("http://localhost:3000/getgphdata?serverName="+serverName+"&comp_date="+comp_date);
  }

  getGraphdata1(comp_date:string){
    return this._httpClient.get<any>("http://localhost:3000/getgphdata?comp_date="+comp_date);
  }
}

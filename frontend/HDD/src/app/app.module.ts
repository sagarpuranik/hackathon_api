// import { BrowserModule } from '@angular/platform-browser';
// import { NgModule } from '@angular/core';
// import { RouterModule, PreloadAllModules } from '@angular/router';
// import { AppComponent } from './app.component';
// import { NewComponentComponent } from './new-component/new-component.component';
// import {GetDataServiceService} from './services/get-data-service.service';
// import { HttpClientModule } from '@angular/common/http'
// import {MatTableModule} from '@angular/material/table';
// import {MatCheckboxModule}  from '@angular/material/checkbox';
// import { MatPaginatorModule, MatFormFieldModule, MatInputModule, MatSelectModule } from '@angular/material';
// import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
// import { FormsModule, ReactiveFormsModule, } from '@angular/forms';

// @NgModule({
//   declarations: [
//     AppComponent,
//     NewComponentComponent
//   ],
//   imports: [
//     BrowserModule,
//     HttpClientModule,
//     MatTableModule,
//     MatCheckboxModule,
//     MatPaginatorModule,
//     MatFormFieldModule,
//     MatInputModule,
//     MatSelectModule,
//     BrowserModule,
//     BrowserAnimationsModule,
//     MatFormFieldModule,
//     FormsModule,
//     ReactiveFormsModule,
//     MatPaginatorModule
//   //     RouterModule.forRoot([
//   //        { path: '', redirectTo: 'Home', pathMatch: 'full' },
//   //        {
//   //         path: 'Home', component: NewComponentComponent,
//   //        }
//   // ])

// ],
//   providers: [GetDataServiceService],
//   bootstrap: [AppComponent]
// })
// export class AppModule { }


import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, PreloadAllModules } from '@angular/router';
import { AppComponent } from './app.component';
import {GetDataServiceService} from './services/get-data-service.service';
import { HttpClientModule } from '@angular/common/http'
import {MatTableModule} from '@angular/material/table';
import {MatIconModule} from '@angular/material/icon';
import {MatCheckboxModule}  from '@angular/material/checkbox';
import { MatPaginatorModule, MatFormFieldModule, MatInputModule, MatSelectModule,MatDatepickerModule,MatNativeDateModule,MatProgressBarModule,MatDividerModule} from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule, } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    MatTableModule,
    MatCheckboxModule,
    MatPaginatorModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    BrowserModule,
    BrowserAnimationsModule,
    MatFormFieldModule,
    FormsModule,
    ReactiveFormsModule,
    MatPaginatorModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatProgressBarModule,
    MatDividerModule,
    MatIconModule
  //     RouterModule.forRoot([
  //        { path: '', redirectTo: 'Home', pathMatch: 'full' },
  //        {
  //         path: 'Home', component: NewComponentComponent,
  //        }
  // ])

],
  providers: [GetDataServiceService],
  bootstrap: [AppComponent]
})
export class AppModule { }

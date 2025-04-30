// filepath: d:\Intersystems\irisnator\ui\src\app\app.module.ts
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms'; // Importa ReactiveFormsModule
import { BrowserModule } from '@angular/platform-browser';
import { HttpClient } from '@angular/common/http'; // Usa provideHttpClient
import { AppComponent } from './app.component';
import { provideHttpClient } from '@angular/common/http'; // Usa provideHttpClient

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    ReactiveFormsModule,
    BrowserModule, 
    HttpClient,
    
  ],
  providers: [
    provideHttpClient()    
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
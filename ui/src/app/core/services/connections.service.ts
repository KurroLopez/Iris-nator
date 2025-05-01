import { Injectable, Provider } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { APP_CONSTANTS } from '../constants';

@Injectable({
  providedIn: 'root'
})
export class ConnectionsService {
  private apiUrl = environment.irisUrl + APP_CONSTANTS.APP_PATH;
 
  constructor(private http: HttpClient) {}
 
  getScore(top: number) {
    return this.http.get(`${this.apiUrl}/score/${top}`);
  }

  getQuestion(question: number) {
    return this.http.get(`${this.apiUrl}/node/${question}`);
  }

  postQuestion(data: any) {
    return this.http.post(`${this.apiUrl}/node`, data);
  }

  postScore(data: any) {
    return this.http.post(`${this.apiUrl}/score`, data);
  }

}
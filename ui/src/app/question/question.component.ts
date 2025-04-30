import { ConnectionsService } from '../core/services/connections.service';
import { Component, EventEmitter, Output } from '@angular/core';
import { CapitalizePipe } from '../shared/pipes/capitalize.pipe';
import { APP_CONSTANTS } from '../core/constants';

@Component({
  selector: 'app-question',
  imports: [CapitalizePipe],
  templateUrl: './question.component.html',
  styleUrl: './question.component.css'
})
export class QuestionComponent {
 questionIndex: number = 1;
 questioNode: number = 1;
 data: any;
 hasData = false;
 @Output() changeStatusEvent = new EventEmitter<string>();
 @Output() updateCharacterEvent = new EventEmitter<string>();
 @Output() notifyUpdateScoreEvent = new EventEmitter<void>();
 @Output() updateDataEvent = new EventEmitter<void>();

  constructor(  private connectionService: ConnectionsService){}

  ngOnInit() {
    this.getQuestion();
  }

  ChangeStatus(status: string) {
      this.changeStatusEvent.emit(status);
    }

  notifyUpdateScoreBoard() {
    this.notifyUpdateScoreEvent.emit();
  }

  updateData() {
    this.updateDataEvent.emit(this.data);
  }

 buttonClick(nodeId: number) {
   switch (nodeId) {
     case 0:
       this.questionIndex = 0;
       this.questioNode = 1;
       this.sendCharacterName();
       break;
       case -1:
         this.questionIndex = 0;
         this.questioNode = 1;
         this.updateData();
         this.ChangeStatus(APP_CONSTANTS.NEW_CHARACTER);
         break;
         default:
          this.questionIndex++;
          this.questioNode = nodeId;
          this.hasData = false;
          this.getQuestion();
          break
        }
      }
      getQuestion(){
        this.connectionService.getQuestion(this.questioNode).subscribe((data:any) => {
          this.data = data;
          this.hasData = true;
      });
    }
    
    sendCharacterName(){
      const data = {characterName: this.data.text};
      this.connectionService.postNewScore(data).subscribe((data:any) => {
        this.notifyUpdateScoreBoard();
        this.updateCharacterEvent.emit(this.data.text);
        this.ChangeStatus(APP_CONSTANTS.CONGRATULATIONS);
      });     
    };
}

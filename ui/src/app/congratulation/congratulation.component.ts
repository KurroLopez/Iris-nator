import { Component, EventEmitter, Input, Output } from '@angular/core';
import { APP_CONSTANTS } from '../core/constants';
import { ConnectionsService } from '../core/services/connections.service';

@Component({
  selector: 'app-congratulation',
  imports: [],
  templateUrl: './congratulation.component.html',
  styleUrl: './congratulation.component.css'
})
export class CongratulationComponent {
  @Output() changeStatusEvent = new EventEmitter<string>();
  @Input() characterName: string = '';
  data: any;

  ChangeStatus() {
    this.changeStatusEvent.emit(APP_CONSTANTS.QUESTION);
  }
}

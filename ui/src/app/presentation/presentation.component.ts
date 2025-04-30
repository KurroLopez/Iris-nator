import { Component, EventEmitter, Output } from '@angular/core';
import { APP_CONSTANTS } from '../core/constants';

@Component({
  selector: 'app-presentation',
  imports: [],
  templateUrl: './presentation.component.html',
  styleUrl: './presentation.component.css'
})
export class PresentationComponent {
  @Output() changeStatusEvent = new EventEmitter<string>();

  ChangeStatus() {
    this.changeStatusEvent.emit(APP_CONSTANTS.QUESTION);
  }
}

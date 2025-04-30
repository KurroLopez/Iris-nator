import { Component, EventEmitter,Input, Output } from '@angular/core';
import { ConnectionsService } from '../core/services/connections.service';
import { APP_CONSTANTS } from '../core/constants';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms'; // Importa FormsModule

@Component({
  selector: 'app-new-character',
  imports: [ReactiveFormsModule ],
  templateUrl: './new-character.component.html',
  styleUrl: './new-character.component.css'
})
export class NewCharacterComponent {
  @Output() changeStatusEvent = new EventEmitter<string>();
  @Input() data: any;

  characterForm: FormGroup;
  
  constructor( 
    private fb: FormBuilder,
    private connectionService: ConnectionsService){
      this.characterForm = this.fb.group({
        oldCharacter: [this.data?.text || '', Validators.required],
        nodeId: [this.data?.nodeId || '', Validators.required],
        newCharacter: ['', Validators.required],
        verb: ['Is', Validators.required],
        text: ['', Validators.required]
      })
  }

  ngOnInit() {
    this.characterForm = this.fb.group({
      oldCharacter: [this.data?.text || '', Validators.required],
      nodeId: [this.data?.nodeId || '', Validators.required],
      newCharacter: ['', Validators.required],
      verb: ['Is', Validators.required],
      text: ['', Validators.required]
    });
    console.log(this.data);

  }
  ChangeStatus() {
    this.changeStatusEvent.emit(APP_CONSTANTS.PRESENTATION);
  }

  onSubmit() {
    this.connectionService.postQuestion(this.characterForm.value).subscribe(
      (response: any) => {
        this.ChangeStatus();
      });
  }

}

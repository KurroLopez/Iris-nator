import { Component, ViewChild, viewChild } from '@angular/core';
import { APP_CONSTANTS } from './core/constants';
import { ScoreComponent } from './score/score.component';
import { QuestionComponent } from './question/question.component';
import { PresentationComponent } from './presentation/presentation.component';
import { CongratulationComponent } from './congratulation/congratulation.component';
import { NewCharacterComponent } from './new-character/new-character.component';

@Component({
  selector: 'app-root',
  imports: [ScoreComponent, QuestionComponent, 
    PresentationComponent, CongratulationComponent,
    NewCharacterComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})

export class AppComponent {
  status = APP_CONSTANTS.PRESENTATION;
  APP_CONSTANTS = APP_CONSTANTS;
  data: any = [];
  characterName: string = '';
  @ViewChild(ScoreComponent) scoreComponent!: ScoreComponent;

  hasChanged: boolean = false;

  changeStatus(status: string) {
    this.status = status;
  }

  onUpdateData(data: any) {
    this.hasChanged = false;
    this.data = data;
    this.hasChanged = true;
  }

  onUpdateCharacter(name: string) {
    this.characterName = name;
  }

  updateScoreBoard() {
    this.scoreComponent.updateScoreBoard();
  }
}


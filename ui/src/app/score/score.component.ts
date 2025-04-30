import { ConnectionsService } from '../core/services/connections.service';
import { APP_CONSTANTS } from '../core/constants';
import { Component } from '@angular/core';

@Component({
  selector: 'app-score',
  imports: [],
  templateUrl: './score.component.html',
  styleUrl: './score.component.css'
})

export class ScoreComponent {
  scores: any[] = [];
  hasData = false;
  constructor(  private connectionService: ConnectionsService) {
    this.updateScoreBoard();
  }

  updateScoreBoard() {
    this.connectionService.getScore(APP_CONSTANTS.DEFAULT_TOP).subscribe((data:any) => {
      this.scores = data.score;
      if (this.scores.length > 0) {
        this.hasData = true;
      }
    });
  }
}

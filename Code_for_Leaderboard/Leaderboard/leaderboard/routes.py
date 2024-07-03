from flask import request, jsonify, render_template
from . import db
from .models import PlayerScore
from . import create_app

app = create_app()

@app.route('/')
def index():
    scores = PlayerScore.query.order_by(PlayerScore.score.desc()).limit(10).all()
    return render_template('index.html', scores=scores)

@app.route('/getScoreboard', methods=['GET'])
def get_scoreboard():
    scores = PlayerScore.query.order_by(PlayerScore.score.desc()).limit(10).all()
    return jsonify([{'userID': s.userID, 'score': s.score} for s in scores])

@app.route('/receivePlayerScore', methods=['POST'])
def receive_player_score():
    data = request.get_json()
    user_id = data.get('userID')
    score = data.get('score')

    if not user_id or not isinstance(score, int):
        return 'Invalid input', 400

    player = PlayerScore.query.filter_by(userID=user_id).first()

    if player:
        if player.score < score:
            player.score = score
            db.session.commit()
    else:
        new_player = PlayerScore(userID=user_id, score=score)
        db.session.add(new_player)
        db.session.commit()

    return 'Score received', 200

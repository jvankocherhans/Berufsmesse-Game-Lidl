from flask import Flask, render_template, jsonify, request, Response
from app import app, db, PlayerScore
import io
import csv

@app.route('/')
def index():
    with app.app_context():
        scores = PlayerScore.query.order_by(PlayerScore.score.desc()).limit(10).all()
        return render_template('index.html', scores=scores)

@app.route('/getScoreboard', methods=['GET'])
def get_scoreboard():
    with app.app_context():
        scores = PlayerScore.query.order_by(PlayerScore.score.desc()).limit(10).all()
        scoreboard = [{'userID': score.userID, 'score': score.score} for score in scores]
        return jsonify(scoreboard)

@app.route('/receivePlayerScore', methods=['POST'])
def receive_player_score():
    data = request.get_json()
    new_score = PlayerScore(userID=data['userID'], score=data['score'])
    with app.app_context():
        db.session.add(new_score)
        db.session.commit()
    return 'Score added!', 201

@app.route('/exportTop3', methods=['GET'])
def export_top3():
    with app.app_context():
        top3 = PlayerScore.query.order_by(PlayerScore.score.desc()).limit(3).all()
        si = io.StringIO()
        cw = csv.writer(si)
        cw.writerow(['userID', 'score'])
        for player in top3:
            cw.writerow([player.userID, player.score])
        output = si.getvalue()
        return Response(output, mimetype="text/csv", headers={"Content-disposition": "attachment; filename=top3.csv"})

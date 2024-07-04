from app import db

class PlayerScore(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    userID = db.Column(db.String(50), unique=True, nullable=False)
    score = db.Column(db.Integer, nullable=False)

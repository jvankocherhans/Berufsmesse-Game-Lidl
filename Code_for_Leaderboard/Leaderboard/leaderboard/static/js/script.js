function updateScoreboard() {
    fetch('/getScoreboard')
        .then(response => response.json())
        .then(data => {
            let scoreboard = document.getElementById('scoreboard');
            scoreboard.innerHTML = '';
            data.forEach(player => {
                let row = document.createElement('tr');
                let userIdCell = document.createElement('td');
                let scoreCell = document.createElement('td');
                userIdCell.textContent = player.userID;
                scoreCell.textContent = player.score;
                row.appendChild(userIdCell);
                row.appendChild(scoreCell);
                scoreboard.appendChild(row);
            });
        });
}

setInterval(updateScoreboard, 5000);  // Aktualisiere alle 5 Sekunden

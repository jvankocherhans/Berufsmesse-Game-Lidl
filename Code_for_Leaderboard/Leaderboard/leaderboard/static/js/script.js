function updateLeaderboard() {
    fetch('/getScoreboard')
        .then(response => response.json())
        .then(data => {
            let leaderboard = document.getElementById('leaderboard');
            leaderboard.innerHTML = '';
            data.forEach(score => {
                let row = document.createElement('tr');
                let userIDCell = document.createElement('td');
                userIDCell.innerText = score.userID;
                let scoreCell = document.createElement('td');
                scoreCell.innerText = score.score;
                row.appendChild(userIDCell);
                row.appendChild(scoreCell);
                leaderboard.appendChild(row);
            });
        });
}

function exportCSV() {
    fetch('/getScoreboard')
        .then(response => response.json())
        .then(data => {
            let csvContent = "data:text/csv;charset=utf-8,UserID,Score\n";
            data.slice(0, 3).forEach(score => {
                csvContent += `${score.userID},${score.score}\n`;
            });
            let encodedUri = encodeURI(csvContent);
            let link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "top_3_players.csv");
            document.body.appendChild(link);
            link.click();
        });
}

setInterval(updateLeaderboard, 5000); // Update every 5 seconds

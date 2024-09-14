import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["randomColor"]

    connect() {
        this.colors = ["Zielony", "Niebieski", "Czerwony"]
    }

    drawColor() {
        const randomColor = this.colors[Math.floor(Math.random() * this.colors.length)]
        this.randomColorTarget.value = randomColor
    }

    refresh() {
        fetch("/surveys", {
            headers: { Accept: "text/vnd.turbo-stream.html" }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(html => {
                const tempDiv = document.createElement('div');
                tempDiv.innerHTML = html;
                const newStream = tempDiv.querySelector('turbo-stream[action="replace"][target="survey-list"]');
                if (newStream) {
                    document.body.appendChild(newStream);
                } else {
                    console.error('Turbo Stream not found');
                }
            })
            .catch(error => console.error('Error:', error));
    }
}

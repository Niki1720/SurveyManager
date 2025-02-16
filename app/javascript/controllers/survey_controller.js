import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["randomColor"]

    connect() {
        this.colors = ["zielony", "niebieski", "czerwony"]
    }

    drawColor() {
        const randomColor = this.colors[Math.floor(Math.random() * this.colors.length)]
        this.randomColorTarget.value = randomColor
    }
}

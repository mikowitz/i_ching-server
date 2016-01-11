class Hexagram {
    constructor() {
        this.hexagramDiv = document.getElementById("hexagram")
        if (!this.hexagramDiv) { return }
        this.lines = this.hexagramDiv.getAttribute("data-lines").split("")
        this.drawLines()
    }

    drawLines() {
        for (var i = this.lines.length; i > 0; i--) {
            let line = this.lines[i-1]
            let row = this.buildRow(line, i)
            this.hexagramDiv.appendChild(row)
        }
    }

    buildRow(line, index) {
        let row = document.createElement("div")
        row.setAttribute("class", "row")
        row.setAttribute("id", `row-${index}`)
        row.setAttribute("data-line", line)
        return this.drawLine(row, line)
    }

    drawLine(row, line) {
        switch(line) {
        case "0":
            for (var additionalClass of ["", "col-sm-offset-4"]) {
                let col = document.createElement("div")
                let classes = ["col-sm-4", "hexagram-line"]
                classes.push(additionalClass)
                col.setAttribute("class", classes.join(" "))
                row.appendChild(col)
            }
            break;
        case "1":
            let col = document.createElement("div")
            col.setAttribute("class", "col-sm-12 hexagram-line")
            row.appendChild(col)
            break;
        }
        return row
    }
}

export default Hexagram

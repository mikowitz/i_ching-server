// let Hexagram = {
//     init() {
//         // let this.hexagramDiv = document.getElementById("hexagram")
//         // if (!hexagramDiv) { return }
//         // let this.lines = hexagramDiv.getAttribute("data-lines").split("")
//         // console.log(this.lines)
//         // this.drawRows()

//     }

//     // drawRows() {
//     //     console.log("OK")
//         // for (var i = this.lines.length; i > 0; i--) {
//         //     let row = document.createElement("div")
//         //     row.setAttribute("class", "row")
//         //     row.setAttribute("id", `row-${i}`)
//         //     row.setAttribute("data-line-type", this.lines[i-1])
//         //     this.hexagramDiv.appendChild(row)
//         //     console.log(`${i} : ${this.lines[i-1]}`)

//         // }
//     // }
// }

class Hexagram {
    constructor() {
        this.hexagramDiv = document.getElementById("hexagram")
        if (!this.hexagramDiv) { return }
        this.lines = this.hexagramDiv.getAttribute("data-lines").split("")
        console.log(this.lines)
        this.drawLines()
    }

    drawLines() {
        console.log("OK")
        for (var i = this.lines.length; i > 0; i--) {
            let row = document.createElement("div")
            let line = this.lines[i-1]
            row.setAttribute("class", "row")
            row.setAttribute("id", `row-${i}`)
            row.setAttribute("data-line-type", line)
            if (line == "0") {
                let col1 = document.createElement("div")
                col1.setAttribute("class", "col-sm-4 hexagram-line")
                row.appendChild(col1)

                let col2 = document.createElement("div")
                col2.setAttribute("class", "col-sm-4 col-sm-offset-4 hexagram-line")
                row.appendChild(col2)
            } else if (line == "1") {
                let col = document.createElement("div")
                col.setAttribute("class", "col-sm-12 hexagram-line")
                row.appendChild(col)
            }
            this.hexagramDiv.appendChild(row)
        }
    }
}

export default Hexagram

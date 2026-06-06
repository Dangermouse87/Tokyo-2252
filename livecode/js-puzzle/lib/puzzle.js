// Hint button

// 1 - Select The Elements We need
const button = document.querySelector("#show-hint");
const hint = document.querySelector(".hint");

console.log(button);
console.log(hint);

// 2 - Add an event listener (click)
button.addEventListener("click", () => {
  // 3 - Change the  dom -> displaying the hint
  hint.classList.remove("d-none");
})

// 3 methods

// canMove
const tiles = document.querySelectorAll('td');

const canMove = (tile) => {
  // check for an empty tile
  const empty = document.querySelector('.empty');
  // get empty row index
  const emptyCell = empty.cellIndex;
  // get empty column index
  const emptyRow = empty.parentElement.rowIndex;
  // get the clicked tile
  const clickedTileCell = tile.cellIndex;
  // get clicked row index
  const clickedTileRow = tile.parentElement.rowIndex;
  // get clicked cell index
  // do a bit of math to check if an adjacent tile is empty

  // const canWeMove = ((emptyRow === clickedTileRow + 1 || emptyRow === clickedTileRow - 1) && emptyCell === clickedTileCell)  || ((emptyCell === clickedTileCell + 1 || emptyCell === clickedTileCell - 1) && (emptyRow === clickedTileRow));
  
  // short version
    const canWeMove = (Math.abs(clickedTileRow - emptyRow) + Math.abs(clickedTileCell - emptyCell) === 1);
  
  return canWeMove;
}

// moveTile

const moveTile = (tile) => {
  // add empty to the click tile
  // select empty tile
  const empty = document.querySelector('.empty');
  // remove empty from empty tile
  empty.classList.remove("empty");
  // change the inner text of empty tile
  empty.innerText = tile.innerText;
  // change the clicked tile to empty
  tile.innerText = "";
  tile.classList.add("empty");
}

// checkIfPlayerWins

const checkIfPlayerWins = () => {
  const winningSequence = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,";
  // define results -> array
  const results = []
	tiles.forEach((tile) => {
		// get the text in an array
    results.push(tile.innerText);
	})
  // compare sequence with results
  return (results.join() === winningSequence)
}


// Do Not Touch

tiles.forEach((tile) => {
  tile.addEventListener('click', () => {
    if (canMove(tile)) {
      moveTile(tile);
    }
    if (checkIfPlayerWins(tiles)) {
      alert("You won!");
    }
  });
});
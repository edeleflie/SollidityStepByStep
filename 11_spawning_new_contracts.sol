pragma solidity ^0.4.0;

/* 
 * Contracts can spawn or instantiate more contracts. There are several reasons 
 * in which this might be useful:
 *
 * 1) Creating complex organisations ... distributed app organisations (DAO)
 * 2) enabling upgrades and bug fixes. A contract can be called on to deploy new-subcontracts and transfer 
 * its state to those new subconctracts
 *
 * In this instance, an 'ArtWork' is abstracted as its own contract that stores the artist, work name, and date.
 * 
 */

contract ArtBank {

	ArtWork[] artworks;

	function registerNewArtwork(bytes32 artist, bytes32 workName, uint yearCreated) public {
		// Note that the artwork owner is whoever called this function
		ArtWork newWork = new ArtWork(msg.sender, artist, workName, yearCreated);
		artworks.push(newWork);
	}

	function countArtWorks() public view returns (uint) {
        return artworks.length;
	}

}

contract ArtWork {
	bytes32 public _artist;
	bytes32 public _workName;
	uint public _yearCreated;
	address public _currentOwner;
	
	function ArtWork(address owner, bytes32 artist, bytes32 workName, uint yearCreated) public{
		_artist = artist;
		_workName = workName;
		_yearCreated = yearCreated;
		_currentOwner = owner;
	}

}
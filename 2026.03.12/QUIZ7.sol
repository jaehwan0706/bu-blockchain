// SPDX-License-Identifier: MIT
pragma solidity ^0.4.11;

contract QUIZ7 {

    address public owner;
    uint public counter;

    string[] public messages;

    event OwnerChanged(address oldOwner, address newOwner);
    event CounterLimitReached(uint counter);

    constructor() {
        owner = msg.sender;
    }

    // 1. 방명록 메시지 추가
    function writeMessage(string memory message) public {
        messages.push(message);
        counter ++;
    }

    // 특정 메시지 조회
    function getMessage(uint index) public view returns(string memory) {
        return messages[index];
    }

    // 2. 관리자 변경
    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "Only owner can change");

        address oldOwner = owner;
        owner = newOwner;

        emit OwnerChanged(oldOwner, newOwner);
    }

    // 3. 카운터 증가 게임
    function increaseCounter(uint num) public {

        require(num < 10, "Cannot increase more than 10");

        counter += num;

        if(counter > 20){
            emit CounterLimitReached(counter);
        }
    }

}
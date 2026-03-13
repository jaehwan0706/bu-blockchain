// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationSystem {
    // 1) 기본 토큰 기능
    mapping(address => uint256) public coinBalance;

    // 2) 기부 기능
    mapping(address => uint256) public donationBalance;
    uint256 public totalDonations;

    // 4) 관리자 권한
    address public manager;

    // 3) 이벤트
    event Transfer(address from, address to, uint256 value);
    event Donate(address donor, uint256 amount);
    event Withdraw(address manager, uint256 amount);

    // 배포 시 초기 코인 지급
    constructor(uint256 _initialSupply) {
        manager = msg.sender;
        coinBalance[msg.sender] = _initialSupply;
    }

    // 코인 전송
    function transfer(address _to, uint256 _amount) public {
        require(_to != address(0), "Invalid address");
        require(_amount > 0, "Amount must be greater than 0");
        require(coinBalance[msg.sender] >= _amount, "Not enough coins");

        coinBalance[msg.sender] -= _amount;
        coinBalance[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
    }

    // 기부
    function donate(uint256 _amount) public {
        require(_amount > 0, "Donation must be greater than 0");
        require(coinBalance[msg.sender] >= _amount, "Not enough balance");

        coinBalance[msg.sender] -= _amount;
        donationBalance[msg.sender] += _amount;
        totalDonations += _amount;

        emit Donate(msg.sender, _amount);
    }

    // 관리자 출금
    function withdrawDonations(uint256 _amount) public {
        require(msg.sender == manager, "Only manager can withdraw");
        require(_amount > 0, "Amount must be greater than 0");
        require(_amount <= totalDonations, "Not enough donations");

        totalDonations -= _amount;
        coinBalance[manager] += _amount;

        emit Withdraw(manager, _amount);
    }

    // 6) 조회 기능 보조 함수
    function getMyCoinBalance() public view returns (uint256) {
        return coinBalance[msg.sender];
    }

    function getMyDonationBalance() public view returns (uint256) {
        return donationBalance[msg.sender];
    }

    function getManager() public view returns (address) {
        return manager;
    }

    function getTotalDonations() public view returns (uint256) {
        return totalDonations;
    }
}
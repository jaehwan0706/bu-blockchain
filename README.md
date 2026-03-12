# Remix IDE Core Concepts

## Remix IDE

Remix IDE는 Solidity 스마트 컨트랙트를 개발하기 위한 웹 기반 통합 개발 환경(IDE)이다.
코드 작성, 컴파일, 배포, 테스트 기능을 제공하며 Ethereum 스마트 컨트랙트 개발에 널리 사용된다.

## Solidity

Solidity는 Ethereum Virtual Machine(EVM)에서 실행되는 스마트 컨트랙트를 작성하기 위한 프로그래밍 언어이다.

## Contract

Contract는 블록체인에서 실행되는 프로그램 단위이다.
데이터(State Variables)와 실행 로직(Function)을 포함하며 배포 후 블록체인에 영구적으로 기록된다.

## State Variables

State Variables는 스마트 컨트랙트의 상태(state)를 저장하는 변수이다.
블록체인에 저장되며 모든 트랜잭션에 의해 변경될 수 있다.

## Function

Function은 컨트랙트 내부 로직을 정의하는 실행 단위이다.
사용자 또는 다른 컨트랙트에 의해 호출될 수 있다.

## Deploy

Deploy는 작성된 스마트 컨트랙트를 블록체인 네트워크에 배포하는 과정이다.
배포가 완료되면 컨트랙트는 고유한 주소(address)를 갖는다.

## Transaction

Transaction은 블록체인 상태를 변경하는 실행 요청이다.
컨트랙트 함수 호출 시 발생하며 블록체인에 기록된다.

## msg.sender

msg.sender는 현재 함수를 호출한 계정의 주소를 나타내는 전역 변수이다.
접근 제어 로직(Access Control)에 자주 사용된다.

## require

require는 조건 검증을 위한 Solidity 명령어이다.
조건이 만족되지 않을 경우 트랜잭션을 즉시 중단하고 상태 변경을 되돌린다.

## Event

Event는 스마트 컨트랙트 실행 과정에서 발생하는 로그 기록 메커니즘이다.
외부 애플리케이션이나 프론트엔드에서 컨트랙트 상태 변화를 추적하는 데 사용된다.

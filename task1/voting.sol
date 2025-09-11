// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting{
    mapping(address addrTo => int count) public tee;

    //一个vote函数，允许用户投票给某个候选人
    function vote(address addrTo,int count) public{
        require(addrTo != address(0),"user is not vaild!");
        require(count == 1," vote count is not vaild!");
        int getCurrentVoteCount = tee[addrTo];
        tee[addrTo] = getCurrentVoteCount + count;
    }

    //一个getVotes函数，返回某个候选人的得票数
    function voteView(address addr) public view returns (int){
        return tee[addr];
    }


    //一个resetVotes函数，重置所有候选人的得票数
    function resetVotes(address addr) public {
        delete tee[addr];
    }
}
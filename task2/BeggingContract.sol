pragma solidity ^0.8;

import "@openzeppelin/contracts/access/Ownable.sol";
//0xd9145CCE52D386f254917e481eB44e9943F39138
contract BeggingContract is Ownable {
    constructor() Ownable(msg.sender) {}
    mapping(address => uint256) public donationsMsg; //捐赠信息映射
    address[] public dornors;//捐赠者地址数组
    //捐赠信息结构体
    struct Donation {
        uint256 startTime; //捐赠开始时间
        uint256 endTime;    //捐赠结束时间

    }
    Donation newDonation; //捐赠信息
    //添加事件
    event DonationEvent(address indexed donor, uint256 amount, uint256 timestamp);
    // 创建捐赠机构
    function createDonation(uint256 duration) public onlyOwner {
        require(duration > 0, "Duration must be greater than zero");
        newDonation = Donation({
            startTime: block.timestamp, //block.timestamp是当前区块的时间戳,以秒为单位
            endTime: block.timestamp + duration
        });
    }
    // 记录每个捐赠者的捐赠金额
    function donate () public payable {
        require(msg.value > 0, "Donation amount must be greater than zero");
        require(newDonation.startTime <= block.timestamp && block.timestamp <= newDonation.endTime, "Donation period has ended");
        donationsMsg[msg.sender] += msg.value;
        dornors.push(msg.sender);
        emit DonationEvent(msg.sender, msg.value, block.timestamp);
    }
    // 提现功能
    function withdraw() public payable onlyOwner {
        require(address(this).balance > 0, "Insufficient contract balance");
        payable(msg.sender).transfer(address(this).balance);
    }

    // 查询某个地址的捐赠金额
    function getDonationAmount(address donor) public view returns (uint256) {
        require(donor != address(0), "Invalid donor address");
        return donationsMsg[donor];
    }
    // 捐赠排行榜显示捐赠金额最多的前3个地址
    function getTop3Donors() public view returns (address[] memory) {
        uint256 len = dornors.length;
        require(len > 0, "No donors available");
        uint256 topCount = len < 3 ? len : 3;
        address[] memory topDonors = new address[](topCount);
        uint256[] memory topAmounts = new uint256[](topCount);
        for(uint i=0;i<len;i++){
            uint256 amt = donationsMsg[dornors[i]];
            for(uint j=0;j<topCount;j++){
                if(amt > topAmounts[j]){
                    //插入
                    for(uint k=topCount-1;k>j;k--){
                        topDonors[k] = topDonors[k-1];
                    }
                    topDonors[j] = dornors[i];
                    break;
                }
            }
        }
        return topDonors;
    }
}
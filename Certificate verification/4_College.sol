// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract cert{
    struct college{
        string colname;
        bool value;
    }
    
    struct cert_details{
        
        string uniname;
        string sname;
        string dept;
        string course;
        string session;
        string registration;
        // string sid;
        string credit;
        string cgpa;
        string sem;
        string ccode;
        string ctitle;
        // string chour;
        // string lgrade;
       
    }
    
    mapping(address=>cert_details) certificates;
    mapping(address=>college) colleges;
    
    // address owner;
    // constructor() public {
    //     owner=msg.sender;
    // }
    // modifier ownerOnly{
    //     require(owner==msg.sender);
    //     _;
    // }

    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier ownerOnly {
        require(owner == msg.sender, "Only contract owner can perform this action");
        _;
    }
    
    event coll_added(string name);//event when college is added
    
    event certadded(string uniname,string sname, string dept,string course,string session, string registration,string credit, string cgpa, string sem,string ccode, string ctitle);
    
    
    function addCollege(address coladd,string memory name) ownerOnly  public{
        colleges[coladd]  =  college(name,true);
        string memory s = "this is how we do";
        emit coll_added(s); //calling event
    }
    
    function checkcoll(address col) view public returns (bool){
        return colleges[col].value;
    }
    
    function viewcert(address sender) view public returns(string memory sname){
        return certificates[sender].sname;
    }
    
    
    function addcert(
        string memory uniname, 
        string memory sname, 
        string memory dept, 
        string memory course,
        string memory session,
        string memory registration,
        string memory credit,
        string memory cgpa, 
        string memory sem, 
        string memory ccode, 
        string memory ctitle
    ) public{
     if(checkcoll(msg.sender)){
             certificates[msg.sender]=cert_details(uniname,sname,dept,course,session,registration, credit, cgpa,sem, ccode,ctitle);
             // Emit event for added certificate
             emit certadded(uniname, sname, dept, course, session, registration, credit, cgpa, sem, ccode, ctitle);
     }
        
    }
}
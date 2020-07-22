Class User.Scr Extends %RegisteredObject
{

ClassMethod Input(caption) As %Status
{
    Do ..Inverse()
    Write !,caption,"  :"
    Do ..Normal()
    Write " "
    Read input
    Return input
}

ClassMethod Confirm() As %Status
{
    Read !,dump
}

ClassMethod Print() As %Status
{
    Write "asdf"
}

ClassMethod ClearScreen() As %Status
{
    Write *27,"[2J"
    Do ..Position(0,0)
    Do ..Normal()
}

ClassMethod Inverse() As %Status
{
    Write *27,"[7m"
}

ClassMethod Normal() As %Status
{
    Write *27,"[0m"
}

ClassMethod Position(x As %Integer, y As %Integer) As %Status
{
    Write *27,"[",x,$C(59),y,"H"
}

}

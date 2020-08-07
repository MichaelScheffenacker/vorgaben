Class User.Scr Extends %RegisteredObject
{

ClassMethod input(caption) As %Status
{
    Do ..inverse()
    Write !,caption,"  :"
    Do ..normal()
    Write " "
    Read input
    Return input
}

ClassMethod confirm() As %Status
{
    Read !,dump
}

ClassMethod print() As %Status
{
    Write "asdf"
}

ClassMethod clearScreen() As %Status
{
    Write *27,"[2J"
    Do ..position(0,0)
    Do ..normal()
}

ClassMethod inverse() As %Status
{
    Write *27,"[7m"
}

ClassMethod normal() As %Status
{
    Write *27,"[0m"
}

ClassMethod position(x As %Integer, y As %Integer) As %Status
{
    Write *27,"[",x,$C(59),y,"H"
}

}

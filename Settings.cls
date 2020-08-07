Class User.Settings Extends %RegisteredObject
{

ClassMethod setting(SettingsNumber) As %Status
{
   
    Set scr=##class(User.input).%New()
    Do scr.clearScreen()

    Write
    Return $$$OK
}

ClassMethod selection() As %Status
{
    Set line=3

    Return $$$OK
}

}

Class User.Setting Extends %RegisteredObject
{

Property title As %String;

Property keys As list Of SettingsVariable;

Property fields As list Of SettingsVariable;

Property allVars As list Of SettingsVariable;

Property tableSpacer As %String;

Method %OnNew(setNum As %Integer) As %Status
{
    Set ..title=^Settings(setNum,"title")
    Set varNum=""
    For  {
        Set varNum=$Order(^Settings(setNum,"keys",varNum))
        Quit:varNum=""
        Do ..keys.Insert(##class(SettingsVariable).%New(setNum,"keys",varNum))
        Do ..allVars.Insert(##class(SettingsVariable).%New(setNum,"keys",varNum))
    }
    Set varNum=""
    For  {
        Set varNum=$Order(^Settings(setNum,"fields",varNum))
        Quit:varNum=""
        Do ..fields.Insert(##class(SettingsVariable).%New(setNum,"fields",varNum))
        Do ..allVars.Insert(##class(SettingsVariable).%New(setNum,"keys",varNum))
    }
    Set ..tableSpacer="  "
    Return $$$OK
}

Method Input() As %Status
{
    Set scr=##class(User.Scr).%New()
    Do  {
        Set keyValues="",fieldValues=""
        Do scr.ClearScreen()
        Write ..title
        Write !
        For i=1:1:..keys.Count() {
            Set caption=..keys.GetAt(i).caption
            If keyValues'="" Set keyValues=keyValues_","
            Set keyValues=keyValues_""""_scr.Input(caption)_""""
        }
        For i=1:1:..fields.Count() {
            Set caption=..fields.GetAt(i).caption
            If fieldValues'="" Set fieldValues=fieldValues_";"
            Set fieldValues=fieldValues_scr.Input(caption)
        }
        Set KillGlobal="^Values("""_..title_""","_keyValues_",1)"
        Set SaveGlobal=KillGlobal_"="""_fieldValues_""""
        Write !
        Write !,"Save (1)"
        Write !,"Delete (2)"
        Write !,"Exit (0)"
        Write !
        Set selection=scr.Input("Select")
        If selection=1 Set @SaveGlobal
        If selection=2 Kill @KillGlobal
        Write !
        ZWrite ^Values
    } While selection'=0
    Return $$$OK
}

}

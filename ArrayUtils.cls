Class User.ArrayUtils Extends %RegisteredObject
{

ClassMethod list(GLOBAL As %String) As %Status
{
    Do ..iterate(GLOBAL,"printEntry")
    Return $$$OK
}

ClassMethod iterate(GLOBAL As %String, callback As %String) As %Status
{
    Do iter(.keys,1,1)
    Return $$$OK

iter(keys,v,lvl)
    Set keys(lvl)=""
    Do {
        Set keys(lvl)=$Order(@..globalStr(GLOBAL,.keys,lvl))
        Quit:keys(lvl)=""
        Set data=$Data(@..globalStr(GLOBAL,.keys,lvl))
        If data=1 Do $ClassMethod(,callback,GLOBAL,.keys,lvl)
        If data=10 Do iter(.keys,v+1,lvl+1)
    } While keys(lvl)'=""
    Return
}

ClassMethod globalStr(GLOBAL As %String, keys, lvl As %Integer) As %Status
{
    Return GLOBAL_"("_..keysStr(.keys,lvl)_")"
}

ClassMethod keysStr(keys, lvl As %Integer) As %Status
{
    Set string=""
    For i=1:1:lvl {
        Set string=string_""""_keys(i)_""""
        If i<lvl Set string=string_","
    }
    Return string
}

ClassMethod printEntry(GLOBAL As %String, keys, lvl As %Integer) As %Status
{
    Set GLOBSTR=..globalStr(GLOBAL,.keys,lvl)
    Write !,GLOBSTR,"=",@GLOBSTR
}

}

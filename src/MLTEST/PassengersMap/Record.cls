/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// RECORDMAP: Generated from RecordMap 'User.PassengersMap'
/// on 2023-09-26 at 10:15:42.445 [2023-09-26 10:15:42.445 UTC]
/// by user SuperUser
Class MLTEST.PassengersMap.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Year As %String;

Property Month As %String;

Property Passengers As %String;

Property Line As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Year</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Passengers</Value>
</Value>
<Value name="5">
<Value>Line</Value>
</Value>
<Value name="6">
<Value>Month</Value>
</Value>
<Value name="7">
<Value>%ParentBatch</Value>
</Value>
</Data>
<DataLocation>^MLTEST.PassengersMap.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^MLTEST.PassengersMap.RecordD</IdLocation>
<IndexLocation>^MLTEST.PassengersMap.RecordI</IndexLocation>
<StreamLocation>^MLTEST.PassengersMap.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

Class MLTEST.BO.PredictionToCSV Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method ExportPrediction(pRequest As Ens.Request, pResponse As Ens.Response) As %Status
{
    set query="SELECT WITH PREDICTIONS (PassengersPrediction) * FROM MLTEST_Data.PassengersLine"
    w ##class(community.csvgen).SQLToCSV(",",1,"/shared/prediction.csv",query)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.Request">
    <Method>ExportPrediction</Method>
  </MapItem>
</MapItems>
}

}

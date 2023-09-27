Class MLTEST.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="MLTEST.Production" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="CSVIn" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">PassengersMap</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/csv/newIn/</Setting>
    <Setting Target="Host" Name="TargetConfigNames">PredictionModelGeneration</Setting>
    <Setting Target="Host" Name="HeaderCount">1</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
  </Item>
  <Item Name="PredictionModelGeneration" Category="" ClassName="MLTEST.BP.PopulateTable" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="PredictionToCSV" Category="" ClassName="MLTEST.BO.PredictionToCSV" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

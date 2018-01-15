<material>
  <div class="two fields" each="{ key, i in window.materialData }">
    <div class="field">
      <input if="{ i == 0 }" placeholder="例：肉" value="{ key.materialName }" id="{ i + '_materialName' }"></input>
      <input if="{ i != 0 }" value="{ key.materialName }" id="{ i + '_materialName' }"></input>
    </div>
    <div class="field">
      <input if="{ i == 0 }" placeholder="例：500g" value="{ key.amount }" id="{ i + '_amount' }"></input>
      <input if="{ i != 0 }" value="{ key.amount }" id="{ i + '_amount' }"></input>

    </div>
  </div>
</material>

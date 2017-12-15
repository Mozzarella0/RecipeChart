<recipeblock>
  <div class="ui two column grid">

    <div each="{ key,data in opts.recipedata }" class="column" >
      <div class="ui tall stacked segment">
        <div class="{ data }">
          <div onclick="{ onlyrecipe.bind(key, data) }" style="cursor: pointer;">
            <a class="ui right corner label" href="/" if="{ !favo }">
              <div data-tooltip="Add Myrecipe">
                <i class="folder open outline icon"></i>
              </div>
            </a>
            <a class="ui orange right corner label" href="/" if="{ favo }">
              <div data-tooltip="Delete Myrecipe">
                <i class="folder outline icon"></i>
              </div>
            </a>
            <div class="ui vertical center aligned segment">
              <small style="opacity: 0.6"> { key.date }</small>
              <h3>{ key.recipeName }</h3>
            </div>
            <div class="ui vertical segment">
              <i if="{ +key.recipeComment.length < 50}">{ key.recipeComment } </i>
              <i if="{ +key.recipeComment.length > 50}">{ key.recipeComment.substr(0, 50) } ... </i>
            </div>
            <div class="ui vertical right aligned segment">
              <small>By { opts.accountdata[key.creatorId].displayName }</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    import route from 'riot-route';

    this.onlyrecipe = (data, click) => {
      window.onlyobj = {
        recipeData : click.item.key,
        recipeId : data,
        creator : opts.accountdata[click.item.key.creatorId].displayName
      };
      window.recipeId = data;
      route(`/viewonly/${data}`);
    };
  </script>
  <style>

  </style>
</recipeblock>

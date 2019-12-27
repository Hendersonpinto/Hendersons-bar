


  <h2 id="lala">Cocktails list</h2>
  <%= link_to "Create a new cocktail", new_cocktail_path %>
  <div class=cocktails_area>
    <% @cocktails.each do |cocktail| %>
    <%= link_to cocktail_path(cocktail) do %>
      <p id="cocktail-name"> <%= cocktail.name %></p>
          <% end %>

    <% end %>

  </div>
    <%= cl_image_tag("gnkundqxkfgr4vix9jfc",
        width: 400, height: 300, crop: :fill) %>

    <%= cl_image_tag("s1zqgyg3ix6upq8a2keh",
        width: 150, height: 150, crop: :thumb, gravity: :face) %>

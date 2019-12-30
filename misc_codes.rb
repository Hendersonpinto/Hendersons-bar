
  <h2 id="lala">Cocktails list</h2>
<div class="container">
<%= simple_form_for [@cocktail] do |f| %>
  <%= f.input :name, label: 'Cocktail name' %>
  <%= f.submit "add a cocktail", class: "btn btn-primary" %>


<% end %>
</div>
<%= link_to "Back to list", cocktails_path, class: "btn btn-primary mt-1"%>




<%= link_to "Show me the cocktail", cocktail_path(@dose.cocktail_id), class: "btn btn-primary mt-1"%>











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







      <%= link_to "Edit this cocktail", editing_path(@cocktail), class: "btn_gold" %>







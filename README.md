<% if @video.errors.any? %> 
  <h2>The following errors prevented the media from being saved</h2> 
  <ul> 
    <% @video.errors.full_messages.each do |msg| %> 
      <li><%= msg %></li> 
    <% end %> 
  </ul>
<% end %>
<%= form_with(model: @video, local: true) do |f| %>
  <p> 
    <%= f.label :Title %><br/> 
    <%= f.text_field :title %>
  </p>
  <p>
    <%= f.label :Description %><br/> 
    <%= f.text_area :description %> 
  </p>
  <p>
    <%= f.label :Link %><br/> 
    <%= f.text_field :link %> 
  </p>
  <p>
    <%= f.submit %> 
  </p>
<% end %>







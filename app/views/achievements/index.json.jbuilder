json.set! :data do
  json.array! @achievements do |achievement|
    json.partial! 'achievements/achievement', achievement: achievement
    json.url  "
              #{link_to 'Show', achievement }
              #{link_to 'Edit', edit_achievement_path(achievement)}
              #{link_to 'Destroy', achievement, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end
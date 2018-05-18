json.extract! teaminvite, :id, :organization_id, :team_id, :email, :status, :user_id, :created_at, :updated_at
json.url teaminvite_url(teaminvite, format: :json)

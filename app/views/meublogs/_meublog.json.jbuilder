json.extract! meublog, :id, :title, :url, :created_at, :updated_at
json.url meublog_url(meublog, format: :json)

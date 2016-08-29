json.extract! department_doctor, :id, :name, :age, :specialization, :email, :password, :department_id, :created_at, :updated_at
json.url department_doctor_url(department_doctor, format: :json)
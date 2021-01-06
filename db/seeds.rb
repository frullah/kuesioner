# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do
  User.where(username: "admin").first_or_create! do |user|
    user.email = "admin@domain.tld"
    user.password = "changeme123"
    user.authenticatable = Admin.find_or_create!(nama: "administrator")
  end
  

  prodi_ti = Prodi.find_or_create_by!(nama: "Teknik Informatika")

  User.where(username: "1101171027").first_or_create! do |user|
    user.password =  "mahasiswa"
    user.authenticatable =  Mahasiswa.find_or_create_by!(
      npm: "1101171027",
      nama: "Fajarullah",
      prodi: prodi_ti
    )
  end

  User.where(username: "1234567890").first_or_create! do |user|
    user.password =  "dosen1"
    user.authenticatable =  Dosen.find_or_create_by!(
      nidn: "1234567890",
      nama: "Ahmad",
      pendidikan: "S2"
    )
  end
  
  MataKuliah.find_or_create_by!(
    nama: "Teknik Simulasi",
    prodi_id: prodi_ti,
    sks: 2,
    semester: 7
  )

  TahunAkademik.find_or_create_by!(
    tahun: 2020,
    ganjil: true
  )
end

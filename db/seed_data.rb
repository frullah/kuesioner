ApplicationRecord.transaction do
  prodi_ti = Prodi.create(nama: "Teknik Informatika")

  User.create(
    username: "",
    authenticatable: Mahasiswa.create(
      npm: "1101171027",
      nama: "Fajarullah",
      prodi: prodi_ti
    )
  )
end
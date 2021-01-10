# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do
  prodi_ti = Prodi.find_or_create_by!(nama: "Teknik Informatika")
  kelas_ti_malam = Kelas.find_or_create_by!(nama: "TI.1.M", prodi: prodi_ti)
  
  admin1 = User.where(username: "admin").first_or_create! do |user|
    user.email = "admin@domain.tld"
    user.password = "changeme123"
    user.authenticatable = Admin.find_or_create_by!(nama: "administrator")
  end

  mahasiswa1 = User.where(username: "1101171027").first_or_create! do |user|
    user.password =  "mahasiswa"
    user.authenticatable =  Mahasiswa.find_or_create_by!(
      npm: "1101171027",
      nama: "Fajarullah",
      prodi: prodi_ti,
      kelas: kelas_ti_malam
    )
  end

  dosen1 = User.where(username: "1234567890").first_or_create! do |user|
    user.password =  "dosen1"
    user.authenticatable =  Dosen.find_or_create_by!(
      nidn: "1234567890",
      nama: "Ahmad",
      pendidikan: "S2"
    )
  end

  mk_teknik_simulasi = MataKuliah.find_or_create_by!(
    nama: "Teknik Simulasi",
    sks: 2,
    semester: 7
  )

  mk_machine_learning = MataKuliah.find_or_create_by!(
    nama: "Machine Learning",
    sks: 3,
    semester: 6
  )

  tahun_akademik = TahunAkademik.find_or_create_by!(
    tahun: 2020,
    ganjil: true
  )

  kuesioner = [
    {
      kategori: "Persiapan",
      pertanyaan: [
        "Dosen menyampaikan kontrak perkuliahan kepada mahasiswa",
        "Dosen menyampaikan tujuan perkuliahan yang akan dicapai"
      ]
    },
    {
      kategori: "Pelaksanaan",
      pertanyaan: [
        "Dosen tepat waktu dalam mengawali danmengakhiri perkuliahan",
        "Dosen menggunakan media/alat pembelajaran dalam setiappertemuan",
        "Dosen menguasi materi kuliah pada saat mengajar",
        "Dosen menggunakan metoda perkuliahan yang bervariasi",
        "Dosen selalu membuka sesi tanya jawab",
        "Dosen memberikan pertemuan tambahan jika materikurang",
        "Dosen mampu memotivasi siswa agar aktif dalam proses belajar mengajar",
        "Penampilan dosen dalam berpakaian rapi, bersih dan serasi",
        "Penggunaan bahasa dalam pelaksanaan perkuliahan : jelas, sopan dansantun ",
        "Dosen bersedia melakukan konsultasi bila mahasiswa kesulitan dalam perkuliahan",
        "Dosen menerima saran dan kritik dari mahasiswa "
      ]
    },
    {
      kategori: "Penilaian Hasil Belajar Mahasiswa",
      pertanyaan: [
        "Soal ujian sesuai dengan materi kuliah yang disampaikan",
        "Dosen obyektif dan transparan dalam memberikan nilai kepada mahasiswa",
        "Jika ada keberatan atas nilai mahasiswa, dosen menerima keberatan tersebut"
      ]
    }
  ]

  kuesioner.each do |kuesioner|
    kategori_kuesioner = KategoriKuesioner.find_or_create_by!(nama: kuesioner[:kategori])
    kuesioner[:pertanyaan].each do |pertanyaan|
      ItemKuesioner.find_or_create_by!(
        kategori_kuesioner: kategori_kuesioner,
        pertanyaan: pertanyaan
      )
    end
  end

  JadwalMataKuliah
    .where(
      mata_kuliah_id: MataKuliah.find_by!(nama: "Teknik Simulasi"),
      dosen_id: Dosen.first,
      tahun_akademik_id: TahunAkademik.find_by!(tahun: 2020, ganjil: true),
      kelas_id: Kelas.find_by(nama: "TI.1.M")
    )
    .first_or_create! do |jadwal|
      jadwal.hari = "Senin"
      jadwal.waktu = Time.new.change({ hour: 18, min: 30 })
    end
end

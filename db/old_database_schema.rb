# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_29_043246) do
  create_table "absn_absensi", primary_key: "absensi_id", id: :integer, force: :cascade do |t|
    t.integer "sesi_kuliah_id", null: false
    t.integer "dim_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "FK_absn_absensi_dim"
    t.index ["sesi_kuliah_id"], name: "FK_absn_absensi_sesi_kuliah_idx"
  end

  create_table "absn_kelas_absensi", primary_key: "kelas_absensi_id", id: :integer, force: :cascade do |t|
    t.integer "penugasan_pengajaran_id", null: false
    t.integer "dim_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_absn_kelas_absensi_dim"
    t.index ["penugasan_pengajaran_id"], name: "fk_absn_kelas_absensi_penugasan_pengajaran"
  end

  create_table "absn_mahasiswa_tidak_hadir", primary_key: "mahasiswa_tidak_hadir_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.integer "sesi_kuliah_id"
    t.column "status", "enum('sakit','izin','absen')"
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.index ["dim_id"], name: "dim_id"
    t.index ["sesi_kuliah_id"], name: "sesi_kuliah_id"
  end

  create_table "absn_sesi_kuliah", primary_key: "sesi_kuliah_id", id: :integer, force: :cascade do |t|
    t.integer "penugasan_pengajaran_id", null: false
    t.integer "lokasi_id", null: false
    t.string "sesi", limit: 1, null: false
    t.text "materi"
    t.boolean "jenis", default: false
    t.datetime "waktu_mulai", precision: nil
    t.datetime "waktu_akhir", precision: nil
    t.integer "minggu"
    t.integer "sesi_mingguan"
    t.text "catatan"
    t.integer "jumlah_dim_krs", default: 0
    t.integer "jumlah_dim_hadir", default: 0
    t.boolean "periode", default: true
    t.integer "penutup_periode"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["lokasi_id"], name: "FK_absn_sesi_kuliah_lokasi_idx"
    t.index ["penugasan_pengajaran_id"], name: "FK_absn_sesi_kuliah_penugasan_pengajaran"
    t.index ["penutup_periode"], name: "fk_absn_sesi_kuliah"
  end

  create_table "adak_dim_transfer", primary_key: "dim_transfer_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.string "ta", limit: 30, default: "0"
    t.integer "sem_ta", default: 0
    t.integer "registrasi_id"
    t.string "universitas_asal", limit: 200
    t.string "fakultas_asal", limit: 200
    t.string "prodi_asal", limit: 200
    t.string "no_sk", limit: 45
    t.integer "deleted", default: 0
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "dim_id"
    t.index ["registrasi_id"], name: "registrasi_id"
  end

  create_table "adak_kelas", primary_key: "kelas_id", id: :integer, force: :cascade do |t|
    t.integer "ta", default: 0, null: false
    t.string "nama", limit: 20, default: "", null: false
    t.text "ket"
    t.integer "dosen_wali_id"
    t.integer "prodi_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["dosen_wali_id"], name: "FK_adak_kelas_wali"
    t.index ["prodi_id"], name: "gk_adak_kelas_inst_prodi"
  end

  create_table "adak_kuliah_transfer", primary_key: "kuliah_transfer_id", id: :integer, force: :cascade do |t|
    t.integer "dim_transfer_id"
    t.integer "nilai_id"
    t.string "grade", limit: 2
    t.string "matakuliah_asal", limit: 200
    t.integer "kuliah_id"
    t.integer "deleted", default: 0
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["dim_transfer_id"], name: "dim_transfer_id"
    t.index ["kuliah_id"], name: "kuliah_id"
    t.index ["nilai_id"], name: "nilai_id"
  end

  create_table "adak_mahasiswa_assistant", primary_key: "mahasiswa_assistant_id", id: :integer, force: :cascade do |t|
    t.integer "pengajaran_id"
    t.integer "dim_id"
    t.boolean "is_fulltime", default: true
    t.date "start_date"
    t.date "end_date"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["dim_id"], name: "FK_adak_mahasiswa_assistant_dim"
    t.index ["pengajaran_id"], name: "FK_adak_mahasiswa_assistant_pengajaran"
  end

  create_table "adak_pengajaran", primary_key: "pengajaran_id", id: :integer, force: :cascade do |t|
    t.integer "kuliah_id"
    t.integer "ta"
    t.integer "sem_ta"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["kuliah_id"], name: "FK_adak_pengajaran_kuliah"
  end

  create_table "adak_penugasan_pengajaran", primary_key: "penugasan_pengajaran_id", id: :integer, force: :cascade do |t|
    t.integer "pengajaran_id"
    t.integer "pegawai_id"
    t.integer "role_pengajar_id", null: false
    t.boolean "is_fulltime", default: true
    t.date "start_date"
    t.date "end_date"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["pegawai_id"], name: "FK_adak_penugasan_pengajaran_pegawai"
    t.index ["pengajaran_id"], name: "FK_adak_penugasan_pengajaran"
    t.index ["role_pengajar_id"], name: "FK_prkl_pengajaran_role_pengajar"
  end

  create_table "adak_registrasi", primary_key: "registrasi_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.string "status_akhir_registrasi", limit: 50, default: "Aktif"
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta", default: 0, null: false
    t.integer "sem", limit: 2, default: 0, null: false
    t.date "tgl_daftar"
    t.float "keuangan", limit: 53
    t.string "kelas", limit: 20
    t.string "id", limit: 20
    t.float "nr"
    t.integer "koa_approval", default: 0, null: false
    t.integer "koa_approval_bp", default: 0, null: false
    t.integer "kelas_id"
    t.integer "dosen_wali_id"
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "iskrs"
    t.index ["dim_id"], name: "fk_t_registrasi_t_dim1_idx"
    t.index ["dosen_wali_id"], name: "fk_t_registrasi_t_profile1_idx"
    t.index ["kelas_id"], name: "fk_t_registrasi_t_kelas1_idx"
  end

  create_table "adak_spp", primary_key: "spp_id", id: :integer, force: :cascade do |t|
    t.integer "ta"
    t.integer "ref_kbk_id"
    t.decimal "spp", precision: 19, scale: 4
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.date "deleted_at"
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "adak_tidak_spp", primary_key: "tidak_spp_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.column "status", "enum('Utang','Lunas')", default: "Utang"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "ta", limit: 5
    t.string "sem_ta", limit: 2
    t.string "bulan", limit: 2
    t.index ["dim_id"], name: "tidak_spp_dim"
  end

  create_table "adak_transfer_file", primary_key: "transfer_file_id", id: :integer, force: :cascade do |t|
    t.integer "dim_transfer_id"
    t.text "nama_file"
    t.string "kode_file", limit: 200
    t.integer "deleted", default: 0
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 200
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 200
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 200
    t.index ["dim_transfer_id"], name: "dim_transfer_id"
  end

  create_table "akmx_aktivitas_kegiatan", primary_key: "aktivitas_kegiatan_id", id: :integer, force: :cascade do |t|
    t.string "judul"
    t.string "lokasi"
    t.integer "sem"
    t.string "ta", limit: 5
    t.string "sk_tugas"
    t.date "tanggal_sk"
    t.integer "jenis_aktivitas_id"
    t.boolean "jenis_anggota"
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["jenis_aktivitas_id"], name: "jenis_aktivitas_id"
    t.index ["sem"], name: "sem"
    t.index ["ta"], name: "ta"
  end

  create_table "akmx_dosen_pembimbing", primary_key: "dosen_pembimbing_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.integer "aktivitas_kegiatan_id"
    t.boolean "pembimbing_ke"
    t.integer "kategori_kegiatan_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["aktivitas_kegiatan_id"], name: "aktivitas_kegiatan_id"
    t.index ["kategori_kegiatan_id"], name: "akmx_dosen_pembimbing_ibfk_4"
    t.index ["pegawai_id"], name: "pegawai_id"
  end

  create_table "akmx_dosen_penguji", primary_key: "dosen_penguji_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.integer "aktivitas_kegiatan_id"
    t.integer "penguji_ke", limit: 1
    t.integer "kategori_kegiatan_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["aktivitas_kegiatan_id"], name: "aktivitas_kegiatan_id"
    t.index ["kategori_kegiatan_id"], name: "akmx_dosen_penguji_ibfk_3"
    t.index ["pegawai_id"], name: "pegawai_id"
  end

  create_table "akmx_peserta", primary_key: "peserta_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.integer "aktivitas_kegiatan_id"
    t.integer "peran_peserta_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["aktivitas_kegiatan_id"], name: "aktivitas_kegiatan_id"
    t.index ["dim_id"], name: "dim_id"
    t.index ["peran_peserta_id"], name: "peran_peserta_id"
  end

  create_table "akmx_r_jenis_aktivitas", primary_key: "jenis_aktivitas_id", id: :integer, force: :cascade do |t|
    t.string "name", null: false
    t.text "desc"
    t.integer "feeder_jenis_aktivitas_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "akmx_r_peran_peserta", primary_key: "peran_peserta_id", id: :integer, force: :cascade do |t|
    t.string "name", null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "arsp_arsip", primary_key: "arsip_id", id: :integer, force: :cascade do |t|
    t.string "judul", limit: 100
    t.text "desc"
    t.integer "user_id", null: false
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["user_id"], name: "FK_arsip_user"
  end

  create_table "arsp_arsip_file", primary_key: "arsip_file_id", id: :integer, force: :cascade do |t|
    t.string "nama_file", limit: 100
    t.string "kode_file", limit: 50
    t.text "desc"
    t.integer "arsip_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["arsip_id"], name: "FK_arsip_file"
  end

  create_table "artk_post", primary_key: "post_id", id: :integer, force: :cascade do |t|
    t.string "title", limit: 225
    t.text "body"
    t.integer "user_id"
    t.string "category", limit: 150
    t.string "in_category", limit: 50, default: "home"
    t.boolean "public_status", default: false
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["user_id"], name: "FK_artk_post_user"
  end

  create_table "artk_post_attachment", primary_key: "post_attachment_id", id: :integer, force: :cascade do |t|
    t.integer "post_id"
    t.string "id_file", limit: 100
    t.string "nama_file", limit: 150
    t.string "keterangan", limit: 150
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["post_id"], name: "FK_artk_post_attachment"
  end

  create_table "askm_absensi", primary_key: "absensi_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id", null: false
    t.column "status_absensi", "enum('sakit','izin','absen')", null: false
    t.text "desc"
    t.string "file", limit: 100
    t.string "kode_file", limit: 100
    t.date "tanggal_mulai"
    t.date "tanggal_akhir"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["dim_id"], name: "dim_id"
  end

  create_table "askm_asrama", primary_key: "asrama_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "lokasi", limit: 45, null: false
    t.text "desc"
    t.integer "kapasitas", default: 0
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_bentuk_pelanggaran", primary_key: "bentuk_id", id: :integer, force: :cascade do |t|
    t.string "name", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_dim_kamar", primary_key: "dim_kamar_id", id: :integer, force: :cascade do |t|
    t.boolean "status_dim_kamar"
    t.integer "dim_id"
    t.integer "kamar_id"
    t.integer "deleted", limit: 1, default: 0
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "askm_dim_kamar_ibfk_3"
    t.index ["kamar_id"], name: "askm_dim_kamar_ibfk_2"
  end

  create_table "askm_dim_pelanggaran", primary_key: "pelanggaran_id", id: :integer, force: :cascade do |t|
    t.boolean "status_pelanggaran", default: false
    t.integer "pembinaan_id", null: false
    t.integer "penilaian_id", null: false
    t.integer "poin_id", null: false
    t.text "desc_pembinaan"
    t.text "desc_pelanggaran"
    t.date "tanggal", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["pembinaan_id"], name: "pembinaan_id"
    t.index ["penilaian_id"], name: "penilaian_id"
    t.index ["poin_id"], name: "poin_id"
  end

  create_table "askm_dim_penilaian", primary_key: "penilaian_id", id: :integer, force: :cascade do |t|
    t.text "desc"
    t.integer "ta"
    t.integer "sem_ta"
    t.integer "akumulasi_skor", default: 0
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "dim_id"
  end

  create_table "askm_izin_bermalam", primary_key: "izin_bermalam_id", id: :integer, force: :cascade do |t|
    t.datetime "rencana_berangkat", precision: nil, null: false
    t.datetime "rencana_kembali", precision: nil, null: false
    t.datetime "realisasi_berangkat", precision: nil
    t.datetime "realisasi_kembali", precision: nil
    t.text "desc", null: false
    t.string "tujuan", limit: 45, null: false
    t.integer "dim_id", null: false
    t.integer "keasramaan_id"
    t.integer "status_request_id", default: 1
    t.integer "pelanggaran_id"
    t.boolean "status_pelanggaran", default: false, comment: "0:default,1:diproses/PK,2:abaikan"
    t.integer "lokasi_log_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_askm_izin_bermalam_dimx_dim1_idx"
    t.index ["keasramaan_id"], name: "fk_askm_izin_bermalam_askm_keasramaan1_idx"
    t.index ["lokasi_log_id"], name: "fk_askm_izin_bermalam_lokasi_log"
    t.index ["pelanggaran_id"], name: "pelanggaran_id"
    t.index ["status_request_id"], name: "fk_askm_izin_bermalam_askm_r_status_request1_idx"
  end

  create_table "askm_izin_dosen_matkul", primary_key: "izin_dosen_matkul_id", id: :integer, force: :cascade do |t|
    t.integer "pengajaran_id"
    t.integer "izin_keluar_id", null: false
    t.integer "status_request_dosen_matkul", default: 1, null: false
    t.integer "dosen_matkul_id"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dosen_matkul_id"], name: "dosen_matkul_id"
    t.index ["izin_keluar_id"], name: "FK_izin_keluar_id"
    t.index ["pengajaran_id"], name: "pengajaran_id"
    t.index ["status_request_dosen_matkul"], name: "askm_r_status"
  end

  create_table "askm_izin_dosen_matkul_log", primary_key: "izin_dosen_matkul_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "pengajaran_id"
    t.integer "izin_keluar_id", null: false
    t.integer "status_request_dosen_matkul", null: false
    t.integer "dosen_matkul_id"
    t.boolean "deleted", null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "deleted_log", precision: nil
    t.index ["dosen_matkul_id"], name: "dosen_matkul_id"
    t.index ["izin_keluar_id"], name: "FK_izin_keluar_id"
    t.index ["pengajaran_id"], name: "pengajaran_id"
    t.index ["status_request_dosen_matkul"], name: "askm_r_status"
  end

  create_table "askm_izin_keluar", primary_key: "izin_keluar_id", id: :integer, force: :cascade do |t|
    t.datetime "rencana_berangkat", precision: nil, null: false
    t.datetime "rencana_kembali", precision: nil, null: false
    t.datetime "realisasi_berangkat", precision: nil
    t.datetime "realisasi_kembali", precision: nil
    t.text "desc", null: false
    t.integer "dim_id", null: false
    t.integer "dosen_wali_id"
    t.integer "baak_id"
    t.integer "keasramaan_id"
    t.integer "pelanggaran_id"
    t.boolean "status_pelanggaran", default: false, comment: "0:default,1:diproses/PK,2:abaikan"
    t.integer "status_request_baak", default: 1
    t.integer "status_request_keasramaan", default: 1
    t.integer "status_request_dosen_wali", default: 1
    t.integer "status_request_dosen_matkul"
    t.string "alasan_penolakan", limit: 100
    t.integer "lokasi_log_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["baak_id"], name: "fk_askm_izin_keluar_hrdx_staf1_idx"
    t.index ["dim_id"], name: "fk_askm_izin_keluar_dimx_dim1_idx"
    t.index ["dosen_wali_id"], name: "fk_askm_izin_keluar_hrdx_dosen1_idx"
    t.index ["keasramaan_id"], name: "fk_askm_izin_keluar_askm_keasramaan1_idx"
    t.index ["lokasi_log_id"], name: "fk_askm_izin_keluar_lokasi_log"
    t.index ["pelanggaran_id"], name: "pelanggaran_id"
    t.index ["status_request_baak"], name: "status_request_baak"
    t.index ["status_request_dosen_matkul"], name: "status_request_dosen_matkul"
    t.index ["status_request_dosen_wali"], name: "fk_askm_izin_keluar_askm_r_status_request1_idx"
    t.index ["status_request_keasramaan"], name: "status_request_keasramaan"
  end

  create_table "askm_izin_kolaboratif", primary_key: "izin_kolaboratif_id", id: :integer, force: :cascade do |t|
    t.date "rencana_mulai", null: false
    t.date "rencana_berakhir", null: false
    t.time "batas_waktu", null: false
    t.text "desc", null: false
    t.integer "dim_id", null: false
    t.integer "status_request_id", default: 1
    t.integer "baak_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["baak_id"], name: "fk_askm_izin_tambahan_jam_kolaboratif_hrdx_staf1_idx"
    t.index ["dim_id"], name: "fk_askm_izin_tambahan_jam_kolaboratif_dimx_dim1_idx"
    t.index ["status_request_id"], name: "fk_askm_izin_tambahan_jam_kolaboratif_askm_r_status_request_idx"
  end

  create_table "askm_izin_ruangan", primary_key: "izin_ruangan_id", id: :integer, force: :cascade do |t|
    t.datetime "rencana_mulai", precision: nil, null: false
    t.datetime "rencana_berakhir", precision: nil, null: false
    t.text "desc", null: false
    t.integer "dim_id", null: false
    t.integer "baak_id"
    t.integer "lokasi_id"
    t.integer "status_request_id", default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["baak_id"], name: "fk_askm_izin_penggunaan_ruangan_hrdx_staf1_idx"
    t.index ["dim_id"], name: "fk_askm_izin_penggunaan_ruangan_dimx_dim1_idx"
    t.index ["lokasi_id"], name: "lokasi_id"
    t.index ["status_request_id"], name: "fk_askm_izin_penggunaan_ruangan_askm_r_status_request1_idx"
  end

  create_table "askm_kamar", primary_key: "kamar_id", id: :integer, force: :cascade do |t|
    t.string "nomor_kamar", limit: 45
    t.integer "asrama_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["asrama_id"], name: "fk_askm_kamar_askm_asrama1_idx"
  end

  create_table "askm_keasramaan", primary_key: "keasramaan_id", id: :integer, force: :cascade do |t|
    t.integer "asrama_id"
    t.integer "pegawai_id"
    t.string "no_hp", limit: 32
    t.string "email", limit: 64
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["asrama_id"], name: "askm_keasramaan_pegawai_ibfk_2"
    t.index ["pegawai_id"], name: "fk_askm_keasramaan_hrdx_pegawai1_idx"
  end

  create_table "askm_log_mahasiswa", primary_key: "log_mahasiswa_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id", null: false
    t.datetime "tanggal_keluar", precision: nil
    t.datetime "tanggal_masuk", precision: nil
    t.integer "lokasi_log_id"
    t.integer "pelanggaran_id"
    t.boolean "status_pelanggaran", comment: "0:default,1:diproses/PK,2:abaikan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_dim_log_mahasiswa"
    t.index ["lokasi_log_id"], name: "fk_lokasi_log_log_mahasiswa"
    t.index ["pelanggaran_id"], name: "pelanggaran_id"
  end

  create_table "askm_pedoman", primary_key: "pedoman_id", id: :integer, force: :cascade do |t|
    t.string "judul"
    t.text "isi", size: :long
    t.integer "jenis_izin"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_pembinaan", primary_key: "pembinaan_id", id: :integer, force: :cascade do |t|
    t.string "name", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_periode", primary_key: "periode_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.integer "jumlah_hari"
    t.integer "batas_toleransi"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_poin_kebaikan", primary_key: "kebaikan_id", id: :integer, force: :cascade do |t|
    t.string "name"
    t.text "desc", size: :long
    t.integer "penilaian_id"
    t.integer "pelanggaran_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["pelanggaran_id"], name: "pelanggaran_id"
    t.index ["penilaian_id"], name: "penilaian_id"
  end

  create_table "askm_poin_pelanggaran", primary_key: "poin_id", id: :integer, force: :cascade do |t|
    t.string "name", null: false
    t.integer "poin"
    t.text "desc"
    t.integer "bentuk_id"
    t.integer "tingkat_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["bentuk_id"], name: "bentuk_id"
    t.index ["tingkat_id"], name: "tingkat_id"
  end

  create_table "askm_r_status_request", primary_key: "status_request_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "status_request", limit: 45, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_tingkat_pelanggaran", primary_key: "tingkat_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "askm_waktu_keluar_masuk", primary_key: "waktu_keluar_masuk_id", id: :integer, force: :cascade do |t|
    t.string "label", limit: 45
    t.string "status", limit: 45
    t.time "senin_kamis"
    t.time "jumat"
    t.time "sabtu"
    t.time "minggu"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "attendance_logs", force: :cascade do |t|
    t.string "status"
    t.string "dim"
    t.integer "total_attend"
    t.integer "total_not_attend"
    t.bigint "attendance_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_session_id"], name: "index_attendance_logs_on_attendance_session_id"
  end

  create_table "attendance_sessions", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.string "begin"
    t.string "end"
    t.string "room"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course"
  end

  create_table "baak_dim_has_surat_lomba", primary_key: "dim_has_surat_lomba_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.integer "surat_lomba_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["dim_id"], name: "FK_baak_dim_has_surat_lomba2"
    t.index ["surat_lomba_id"], name: "FK_baak_dim_has_surat_lomba"
  end

  create_table "baak_dim_has_surat_magang", primary_key: "dim_has_surat_magang_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.integer "surat_magang_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["dim_id"], name: "FK_baak_dim_has_surat_magang2"
    t.index ["surat_magang_id"], name: "FK_baak_dim_has_surat_magang"
  end

  create_table "baak_dim_has_surat_pengantar_proyek", primary_key: "dim_has_surat_pengantar_proyek_id", id: :integer, force: :cascade do |t|
    t.integer "surat_pengantar_proyek_id"
    t.integer "dim_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["dim_id"], name: "FK_baak_dim_has_surat_pengantar_proyek2"
    t.index ["surat_pengantar_proyek_id"], name: "FK_baak_dim_has_surat_pengantar_proyek"
  end

  create_table "baak_dim_has_surat_pengantar_ta", primary_key: "dim_has_surat_pengantar_ta", id: :integer, force: :cascade do |t|
    t.integer "surat_pengantar_ta_id"
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "dim_has_surat_pengantar_ta_2"
    t.index ["surat_pengantar_ta_id"], name: "dim_has_surat_pengantar_ta"
  end

  create_table "baak_dim_has_surat_permohonan_kp", primary_key: "dim_has_surat_permohonan_kp_id", id: :integer, force: :cascade do |t|
    t.integer "surat_permohonan_kp_id"
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "FK_dim_has_permohonan_kp"
    t.index ["surat_permohonan_kp_id"], name: "FK_permohonan_kp_has_permohonan_kp"
  end

  create_table "baak_format_nomor_surat", primary_key: "format_nomor_surat_id", id: :integer, force: :cascade do |t|
    t.string "format_nomor", limit: 32
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "baak_kaos_del", primary_key: "kaos_del_id", id: :integer, force: :cascade do |t|
    t.string "kode_ukuran", limit: 5
    t.string "ukuran", limit: 32
    t.integer "stok"
    t.integer "pegawai_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["pegawai_id"], name: "FK_baak_kaos_del"
  end

  create_table "baak_kartu_tanda_mahasiswa", primary_key: "kartu_tanda_mahasiswa_id", id: :integer, force: :cascade do |t|
    t.text "alasan"
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.datetime "waktu_pengambilan", precision: nil
    t.index ["pegawai_id"], name: "FK_baak_kartu_tanda_mahasiswap"
    t.index ["pemohon_id"], name: "FK_baak_ktm_pengaju"
    t.index ["status_pengajuan_id"], name: "FK_baak_kartu_tanda_mahasiswa"
  end

  create_table "baak_kop_surat", primary_key: "kop_surat_id", id: :integer, force: :cascade do |t|
    t.text "kop_surat", null: false
    t.text "desc", null: false
    t.string "nama_institut", limit: 32
    t.text "alamat"
    t.string "nomor_telepon", limit: 32
    t.string "nomor_fax", limit: 32
    t.string "email", limit: 32
    t.string "alamat_web", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "baak_r_nomor_surat_terakhir", primary_key: "nomor_surat_terakhir_id", id: :integer, force: :cascade do |t|
    t.integer "format_nomor_surat_id"
    t.integer "nomor_surat"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["format_nomor_surat_id"], name: "fk_nomor_surat_terakhir_format_nomor_surat"
  end

  create_table "baak_r_status_pengajuan", primary_key: "status_pengajuan_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "baak_surat_keterangan_lulus", primary_key: "surat_keterangan_lulus_id", id: :integer, force: :cascade do |t|
    t.boolean "is_yudisium", default: false
    t.string "nomor_surat", limit: 32
    t.string "nomor_surat_lengkap", limit: 45
    t.integer "kop_surat_id"
    t.date "tanggal_surat"
    t.text "judul_ta"
    t.date "tanggal_sidang_ta"
    t.string "sk_dekan", limit: 322
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.integer "penandatangan_id"
    t.datetime "waktu_pengambilan", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["kop_surat_id"], name: "kop_surat_id"
    t.index ["pegawai_id"], name: "FK_baak_surat_rekomendasi_mbkm2"
    t.index ["pemohon_id"], name: "FK_baak_surat_rekomendasi_mbkm"
    t.index ["penandatangan_id"], name: "baak_surat_rekomendasi_mbkm_ibfk_5"
    t.index ["sk_dekan"], name: "koordinator_id"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_rekomendasi_mbkm3"
  end

  create_table "baak_surat_lomba", primary_key: "surat_lomba_id", id: :integer, force: :cascade do |t|
    t.string "nomor_surat", limit: 45
    t.string "nomor_surat_lengkap", limit: 100
    t.text "perihal"
    t.text "alamat_tujuan"
    t.string "banyak_lampiran", limit: 45
    t.text "salam_pembuka"
    t.date "tanggal_surat"
    t.string "nama_lomba", limit: 45
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.datetime "waktu_pengambilan", precision: nil
    t.integer "penandatangan"
    t.integer "kop_surat_id"
    t.index ["kop_surat_id"], name: "kop_surat_id"
    t.index ["pegawai_id"], name: "FK_baak_surat_lombap"
    t.index ["pemohon_id"], name: "FK_baak_surat_lomba_pengaju"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_lomba2"
  end

  create_table "baak_surat_magang", primary_key: "surat_magang_id", id: :integer, force: :cascade do |t|
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 45
    t.string "perihal_surat", limit: 100
    t.date "tanggal_surat"
    t.string "nama_perusahaan", limit: 250, null: false
    t.text "alamat_perusahaan", null: false
    t.date "waktu_awal_magang", null: false
    t.date "waktu_akhir_magang", null: false
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.datetime "waktu_pengambilan", precision: nil
    t.integer "penandatangan"
    t.integer "kop_surat_id"
    t.index ["kop_surat_id"], name: "kop_surat_id"
    t.index ["pegawai_id"], name: "FK_baak_surat_magangp"
    t.index ["pemohon_id"], name: "FK_baak_surat_magang_pengaju"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_magang"
  end

  create_table "baak_surat_mahasiswa_aktif", primary_key: "surat_mahasiswa_aktif_id", id: :integer, force: :cascade do |t|
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 45
    t.text "tujuan"
    t.date "tanggal_surat"
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.datetime "waktu_pengambilan", precision: nil
    t.integer "penandatangan"
    t.integer "kop_surat_id"
    t.index ["kop_surat_id"], name: "kop_surat_id"
    t.index ["pegawai_id"], name: "FK_baak_surat_mahasiswa_aktifp"
    t.index ["pemohon_id"], name: "FK_baak_surat_mahasiswa_aktif_pengaju"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_mahasiswa_aktif2"
  end

  create_table "baak_surat_pengantar_proyek", primary_key: "surat_pengantar_proyek_id", id: :integer, force: :cascade do |t|
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 45
    t.text "perihal_surat"
    t.string "nama_tujuan", limit: 45
    t.text "alamat_tujuan"
    t.string "banyak_lampiran", limit: 45
    t.integer "kuliah_id"
    t.text "salam_pembuka"
    t.date "tanggal_surat"
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.datetime "waktu_pengambilan", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.integer "penandatangan"
    t.integer "kop_surat_id"
    t.index ["kop_surat_id"], name: "kop_surat_id"
    t.index ["kuliah_id"], name: "FK_baak_surat_pengantar_proyek4"
    t.index ["pegawai_id"], name: "FK_baak_surat_pengantar_proyek2"
    t.index ["pemohon_id"], name: "FK_baak_surat_pengantar_proyek"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_pengantar_proyek3"
  end

  create_table "baak_surat_pengantar_ta", primary_key: "surat_pengantar_ta_id", id: :integer, force: :cascade do |t|
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 45
    t.text "perihal_surat"
    t.string "nama_instansi", limit: 45
    t.text "alamat_instansi"
    t.integer "kuliah_id"
    t.text "informasi"
    t.date "tanggal_surat"
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.date "waktu_pengambilan"
    t.integer "kop_surat_id"
    t.integer "penandatangan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["kop_surat_id"], name: "FK_baak_surat_pengantar_ta_5"
    t.index ["kuliah_id"], name: "FK_baak_surat_pengantar_ta_4"
    t.index ["pegawai_id"], name: "FK_baak_surat_pengantar_ta_2"
    t.index ["pemohon_id"], name: "FK_baak_surat_pengantar_ta"
    t.index ["penandatangan"], name: "FK_baak_surat_pengantar_ta_6"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_pengantar_ta_3"
  end

  create_table "baak_surat_pengantar_ta_has_variabel", primary_key: "surat_pengantar_ta_has_variable_id", id: :integer, force: :cascade do |t|
    t.integer "surat_pengantar_ta_id"
    t.string "name", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["surat_pengantar_ta_id"], name: "surat_pengantar_ta_has_variabel"
  end

  create_table "baak_surat_permohonan_kp", primary_key: "surat_permohonan_kp_id", id: :integer, force: :cascade do |t|
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 45
    t.text "perihal_surat"
    t.string "nama_tujuan", limit: 45
    t.text "alamat_tujuan"
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.date "tanggal_surat"
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.date "waktu_pengambilan"
    t.integer "kop_surat_id"
    t.integer "penandatangan"
    t.date "waktu_awal_kp"
    t.date "waktu_akhir_kp"
    t.string "tahun_ajaran", limit: 9
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["kop_surat_id"], name: "FK_surat_permohonan_kp_4"
    t.index ["pegawai_id"], name: "FK_surat_permohonan_kp_2"
    t.index ["pemohon_id"], name: "FK_surat_permohonan_kp"
    t.index ["penandatangan"], name: "FK_surat_permohonan_kp_5"
    t.index ["status_pengajuan_id"], name: "FK_surat_permohonan_kp_3"
  end

  create_table "baak_surat_rekomendasi_mbkm", primary_key: "surat_rekomendasi_mbkm_id", id: :integer, force: :cascade do |t|
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 45
    t.integer "kop_surat_id"
    t.date "tanggal_surat"
    t.integer "koordinator_id"
    t.string "angkatan_mbkm", limit: 32
    t.integer "tahun_mbkm"
    t.integer "sem_mbkm"
    t.integer "pemohon_id"
    t.integer "pegawai_id"
    t.integer "status_pengajuan_id", default: 1
    t.text "alasan_penolakan"
    t.integer "penandatangan_id"
    t.datetime "waktu_pengambilan", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["koordinator_id"], name: "koordinator_id"
    t.index ["kop_surat_id"], name: "kop_surat_id"
    t.index ["pegawai_id"], name: "FK_baak_surat_rekomendasi_mbkm2"
    t.index ["pemohon_id"], name: "FK_baak_surat_rekomendasi_mbkm"
    t.index ["penandatangan_id"], name: "baak_surat_rekomendasi_mbkm_ibfk_5"
    t.index ["status_pengajuan_id"], name: "FK_baak_surat_rekomendasi_mbkm3"
  end

  create_table "cist_atasan_cuti_nontahunan", primary_key: "atasan_cuti_nontahunan_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_cuti_nontahunan_id"
    t.integer "pegawai_id"
    t.string "name", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.integer "status_by_atasan", default: 1
    t.text "catatan_by_atasan"
    t.index ["permohonan_cuti_nontahunan_id"], name: "FK_cist_atasan_cuti_nontahunan"
  end

  create_table "cist_atasan_cuti_tahunan", primary_key: "atasan_cuti_tahunan_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_cuti_tahunan_id"
    t.integer "pegawai_id"
    t.string "name", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.integer "status_by_atasan", default: 1
    t.text "catatan_by_atasan"
    t.index ["permohonan_cuti_tahunan_id"], name: "FK_cist_atasan_cuti_tahunan"
  end

  create_table "cist_atasan_izin", primary_key: "atasan_izin_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_izin_id"
    t.integer "pegawai_id"
    t.string "name", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.integer "status_by_atasan", default: 1
    t.text "catatan_by_atasan"
    t.index ["permohonan_izin_id"], name: "FK_cist_atasan_izin"
  end

  create_table "cist_atasan_surat_tugas", primary_key: "atasan_surat_tugas_id", id: :integer, force: :cascade do |t|
    t.integer "surat_tugas_id"
    t.integer "id_pegawai"
    t.integer "perequest"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["id_pegawai"], name: "fk_cist_atasan_hrdx_pegawai"
    t.index ["perequest"], name: "FK_cist_atasan_surat_tugas_2"
    t.index ["surat_tugas_id"], name: "FK_cist_atasan_surat_tugas"
  end

  create_table "cist_golongan_kuota_cuti", primary_key: "golongan_kuota_cuti_id", id: :integer, force: :cascade do |t|
    t.string "nama_golongan", limit: 100
    t.integer "min_tahun_kerja"
    t.integer "max_tahun_kerja"
    t.integer "kuota"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "cist_kategori_cuti_nontahunan", primary_key: "kategori_cuti_nontahunan_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "lama_pelaksanaan"
    t.integer "satuan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "cist_kategori_izin", primary_key: "kategori_izin_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "cist_laporan_surat_tugas", primary_key: "laporan_surat_tugas_id", id: :integer, force: :cascade do |t|
    t.integer "surat_tugas_id", null: false
    t.integer "status_id"
    t.string "nama_file", limit: 200
    t.string "lokasi_file", limit: 100
    t.date "tanggal_submit"
    t.datetime "batas_submit", precision: nil, null: false
    t.string "kode_laporan", limit: 100
    t.text "review_laporan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["status_id"], name: "FK_status_laporan_surat_tugas"
    t.index ["surat_tugas_id"], name: "fk_cist_laporan_surat_tugas_cist_surat_tugas1_idx"
  end

  create_table "cist_permohonan_cuti_nontahunan", primary_key: "permohonan_cuti_nontahunan_id", id: :integer, force: :cascade do |t|
    t.date "tgl_mulai"
    t.date "tgl_akhir"
    t.text "alasan_cuti"
    t.integer "lama_cuti"
    t.integer "kategori_id", null: false
    t.text "pengalihan_tugas", size: :tiny
    t.integer "status_cuti_nontahunan_id"
    t.text "catatan_wr2"
    t.integer "pegawai_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["kategori_id"], name: "FK_cist_permohonan_cuti_nontahunan"
    t.index ["pegawai_id"], name: "FK_cist_permohonan_cuti_pegawai"
    t.index ["status_cuti_nontahunan_id"], name: "cist_permohonan_cuti_nontahunan_ibfk_1"
  end

  create_table "cist_permohonan_cuti_tahunan", primary_key: "permohonan_cuti_tahunan_id", id: :integer, force: :cascade do |t|
    t.string "waktu_pelaksanaan", limit: 500, null: false
    t.text "alasan_cuti"
    t.integer "lama_cuti"
    t.text "pengalihan_tugas"
    t.integer "status_izin_id"
    t.text "catatan_wr2"
    t.integer "pegawai_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["pegawai_id"], name: "FK_cist_permohonan_cuti_tahunan"
    t.index ["status_izin_id"], name: "cist_permohonan_cuti_tahunan_ibfk_1"
  end

  create_table "cist_permohonan_izin", primary_key: "permohonan_izin_id", id: :integer, force: :cascade do |t|
    t.string "waktu_pelaksanaan", limit: 500, null: false
    t.text "alasan_izin"
    t.text "pengalihan_tugas"
    t.integer "kategori_id", null: false
    t.integer "lama_izin", null: false
    t.text "file_surat"
    t.string "kode_file_surat", limit: 200
    t.integer "status_izin_id"
    t.text "catatan_wr2"
    t.integer "atasan_id", null: false
    t.integer "pegawai_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["atasan_id"], name: "FK_atasan_izin"
    t.index ["kategori_id"], name: "FK_cist_kategori_izin"
    t.index ["pegawai_id"], name: "FK_cist_permohonan_izin"
    t.index ["status_izin_id"], name: "status_izin_id"
  end

  create_table "cist_r_jenis_surat", primary_key: "jenis_surat_id", id: :integer, force: :cascade do |t|
    t.string "jenis_surat", limit: 100
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "cist_r_jumlah_libur", primary_key: "jumlah_libur_id", id: :integer, force: :cascade do |t|
    t.integer "jumlah"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil, null: false
    t.string "deleted_by", limit: 32, null: false
    t.string "created_by", limit: 32, null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "updated_by", limit: 32, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cist_r_kuota_cuti_tahunan", primary_key: "kuota_cuti_tahunan_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id", null: false
    t.integer "kuota"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["pegawai_id"], name: "FK_cist_kuota_cuti_tahunan"
  end

  create_table "cist_r_status", primary_key: "status_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "cist_r_waktu_generate_kuota_cuti", primary_key: "waktu_generate_kuota_cuti_id", id: :integer, force: :cascade do |t|
    t.datetime "waktu_generate_terakhir", precision: nil, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil, null: false
    t.string "deleted_by", limit: 32, null: false
    t.string "created_by", limit: 32, null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "updated_by", limit: 32, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cist_status_cuti_nontahunan", primary_key: "status_cuti_nontahunan_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_cuti_nontahunan_id", null: false
    t.integer "status_by_hrd", default: 1
    t.integer "status_by_atasan", default: 1
    t.integer "status_by_wr2", default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["permohonan_cuti_nontahunan_id"], name: "FK_cist_r_status_cuti_nontahunan"
    t.index ["status_by_atasan"], name: "status_by_atasan"
    t.index ["status_by_hrd"], name: "status_by_hrd"
    t.index ["status_by_wr2"], name: "status_by_wr2"
  end

  create_table "cist_status_cuti_tahunan", primary_key: "status_cuti_tahunan_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_cuti_tahunan_id", null: false
    t.integer "status_by_hrd", default: 1
    t.integer "status_by_atasan", default: 1
    t.integer "status_by_wr2", default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["permohonan_cuti_tahunan_id"], name: "FK_cist_r_status_cuti_tahunan"
    t.index ["status_by_atasan"], name: "status_by_atasan"
    t.index ["status_by_hrd"], name: "status_by_hrd"
    t.index ["status_by_wr2"], name: "status_by_wr2"
  end

  create_table "cist_status_izin", primary_key: "status_izin_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_izin_id"
    t.integer "status_by_atasan", default: 1
    t.integer "status_by_wr2", default: 1
    t.integer "status_by_hrd", default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["permohonan_izin_id"], name: "permohonan_izin_id"
    t.index ["status_by_atasan"], name: "status_by_atasan"
    t.index ["status_by_hrd"], name: "status_by_hrd"
    t.index ["status_by_wr2"], name: "status_by_wr2"
  end

  create_table "cist_surat_tugas", primary_key: "surat_tugas_id", id: :integer, force: :cascade do |t|
    t.integer "perequest", null: false
    t.string "no_surat", limit: 45
    t.string "tempat", limit: 100
    t.datetime "tanggal_berangkat", precision: nil
    t.datetime "tanggal_kembali", precision: nil
    t.datetime "tanggal_mulai", precision: nil
    t.datetime "tanggal_selesai", precision: nil
    t.date "tanggal_surat"
    t.string "agenda", limit: 100
    t.text "pengalihan_tugas"
    t.text "review_surat"
    t.text "transportasi"
    t.text "desc_surat_tugas"
    t.text "catatan"
    t.integer "jenis_surat_id"
    t.date "submit_laporan"
    t.integer "status_id"
    t.boolean "status_sppd", default: false
    t.integer "penandatangan"
    t.integer "penyetuju"
    t.string "nama_kegiatan", limit: 100
    t.datetime "kembali_bekerja", precision: nil
    t.datetime "realisasi_berangkat", precision: nil
    t.datetime "realisasi_kembali", precision: nil
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["jenis_surat_id"], name: "FK_jenis_surat"
    t.index ["perequest"], name: "fk_cist_surat_tugas_cist_pegawai1_idx"
    t.index ["status_id"], name: "FK_cist_status"
  end

  create_table "cist_surat_tugas_assignee", primary_key: "surat_tugas_assignee_id", id: :integer, force: :cascade do |t|
    t.integer "id_pegawai"
    t.integer "surat_tugas_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["id_pegawai"], name: "FK_cist_surat_tugas_assignee"
    t.index ["surat_tugas_id"], name: "FK_surat"
  end

  create_table "cist_surat_tugas_file", primary_key: "surat_tugas_file_id", id: :integer, force: :cascade do |t|
    t.string "nama_file", limit: 100
    t.string "lokasi_file", limit: 100
    t.integer "surat_tugas_id"
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.string "deleted_by", limit: 32
    t.date "updated_at"
    t.string "updated_by", limit: 32
    t.date "created_at"
    t.string "created_by", limit: 32
    t.string "kode_file", limit: 100
    t.index ["surat_tugas_id"], name: "FK_cist_surat_tugas_file"
  end

  create_table "cist_waktu_cuti_tahunan", primary_key: "waktu_cuti_tahunan_id", id: :integer, force: :cascade do |t|
    t.integer "permohonan_cuti_tahunan_id"
    t.date "durasi"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["permohonan_cuti_tahunan_id"], name: "FK_cist_waktu_cuti_tahunan"
  end

  create_table "dimx_alumni", primary_key: "alumni_id", id: :integer, force: :cascade do |t|
    t.integer "ta", default: 0, null: false
    t.integer "sem", default: 0, null: false
    t.string "nim", limit: 8, default: "", null: false
    t.string "status", limit: 50, default: "", null: false
    t.date "tanggal_lulus"
    t.integer "sks_lulus"
    t.float "ipk_lulus"
    t.string "no_sk_yudisium", limit: 100
    t.date "tanggal_sk"
    t.string "no_ijazah", limit: 40
    t.string "no_transkrip", default: "", null: false
    t.string "predikat_lulus", limit: 100, default: "", null: false
    t.text "judul_ta", null: false
    t.string "pembimbing1", limit: 20
    t.string "pembimbing2", limit: 20
    t.integer "dosen_id_1"
    t.integer "dosen_id_2"
    t.integer "dim_id", null: false
    t.integer "n_toefl", default: 0, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.integer "predikat_lulus_id"
    t.index ["dim_id"], name: "fk_t_alumni_t_dim1_idx"
    t.index ["dosen_id_1"], name: "FK_dimx_alumni_dosen_1"
    t.index ["dosen_id_2"], name: "FK_dimx_alumni_dosen_2"
  end

  create_table "dimx_alumni_data", primary_key: "alumni_data_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.string "alamat", limit: 100, default: "", null: false
    t.string "kota"
    t.string "propinsi"
    t.string "email", limit: 100, default: "", null: false
    t.string "hp", limit: 20, default: "", null: false
    t.string "telepon", limit: 20
    t.integer "alumni_id"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["alumni_id"], name: "fk_t_alumni_data_t_alumni1_idx"
    t.index ["nim"], name: "NIM_UNIQUE", unique: true
  end

  create_table "dimx_alumni_pekerjaan", primary_key: "alumni_pekerjaan_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.date "tgl_start", null: false
    t.date "tgl_end"
    t.string "nama_perusahaan", limit: 200, default: "", null: false
    t.string "alamat_perusahaan"
    t.string "bidang_perusahaan"
    t.string "bidang_pekerjaan", limit: 100, default: "", null: false
    t.string "gaji", limit: 100
    t.integer "alumni_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["alumni_id"], name: "fk_t_ALUMNI_PEKERJAAN_t_ALUMNI_DATA_idx"
  end

  create_table "dimx_dim", primary_key: "dim_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.string "no_usm", limit: 15, default: "", null: false
    t.string "jalur", limit: 20
    t.string "user_name", limit: 10
    t.string "kbk_id", limit: 20
    t.integer "ref_kbk_id"
    t.string "kpt_prodi", limit: 10
    t.integer "id_kur", default: 0, null: false
    t.integer "tahun_kurikulum_id"
    t.string "nama", limit: 50, null: false
    t.date "tgl_lahir"
    t.string "tempat_lahir", limit: 50
    t.string "gol_darah", limit: 2
    t.integer "golongan_darah_id"
    t.string "jenis_kelamin", limit: 1
    t.integer "jenis_kelamin_id"
    t.string "agama", limit: 30
    t.integer "agama_id"
    t.string "nik", limit: 16
    t.string "nisn", limit: 10
    t.string "no_kps", limit: 100
    t.text "alamat"
    t.string "kelurahan", limit: 32
    t.integer "kecamatan_id"
    t.string "kabupaten", limit: 50
    t.string "kode_pos", limit: 5
    t.string "email", limit: 50
    t.string "telepon", limit: 50
    t.string "hp", limit: 50
    t.string "hp2", limit: 50
    t.string "no_ijazah_sma", limit: 100
    t.string "nama_sma", limit: 50
    t.integer "asal_sekolah_id"
    t.integer "sekolah_dapodik_id"
    t.text "alamat_sma"
    t.string "kabupaten_sma", limit: 100
    t.string "telepon_sma", limit: 50
    t.string "kodepos_sma", limit: 8
    t.integer "thn_masuk"
    t.string "status_akhir", limit: 50, default: "Aktif"
    t.string "nama_ayah", limit: 50
    t.string "nama_ibu", limit: 50
    t.string "nik_ayah", limit: 16
    t.string "nik_ibu", limit: 16
    t.date "tanggal_lahir_ayah"
    t.date "tanggal_lahir_ibu"
    t.string "no_hp_ayah", limit: 50
    t.string "no_hp_ibu", limit: 50
    t.text "alamat_orangtua"
    t.integer "pendidikan_ayah_id"
    t.string "pekerjaan_ayah", limit: 100
    t.integer "pekerjaan_ayah_id"
    t.text "keterangan_pekerjaan_ayah"
    t.string "penghasilan_ayah", limit: 50
    t.integer "penghasilan_ayah_id"
    t.integer "pendidikan_ibu_id"
    t.string "pekerjaan_ibu", limit: 100
    t.integer "pekerjaan_ibu_id"
    t.text "keterangan_pekerjaan_ibu"
    t.string "penghasilan_ibu", limit: 50
    t.integer "penghasilan_ibu_id"
    t.string "nama_wali", limit: 50
    t.date "tanggal_lahir_wali"
    t.integer "pendidikan_wali_id"
    t.string "pekerjaan_wali", limit: 50
    t.integer "pekerjaan_wali_id"
    t.text "keterangan_pekerjaan_wali"
    t.string "penghasilan_wali", limit: 50
    t.integer "penghasilan_wali_id"
    t.text "alamat_wali"
    t.string "telepon_wali", limit: 20
    t.string "no_hp_wali", limit: 50
    t.string "pendapatan", limit: 50
    t.float "ipk", default: 0.0
    t.integer "anak_ke", limit: 1
    t.integer "dari_jlh_anak", limit: 1
    t.integer "jumlah_tanggungan", limit: 1
    t.float "nilai_usm"
    t.integer "score_iq", limit: 1
    t.string "rekomendasi_psikotest", limit: 4
    t.string "foto", limit: 50
    t.string "kode_foto", limit: 100
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["agama_id"], name: "FK_dimx_dim_agama"
    t.index ["asal_sekolah_id"], name: "FK_dimx_dim_asal_sekolah"
    t.index ["golongan_darah_id"], name: "FK_dimx_dim_golongan_darah"
    t.index ["jenis_kelamin_id"], name: "FK_dimx_dim_jenis_kelamin"
    t.index ["nim"], name: "NIM"
    t.index ["nim"], name: "NIM_UNIQUE", unique: true
    t.index ["pekerjaan_ayah_id"], name: "FK_dimx_dim_pekerjaan_ayah"
    t.index ["pekerjaan_ibu_id"], name: "FK_dimx_dim_pekerjaan_ibu"
    t.index ["pekerjaan_wali_id"], name: "FK_dimx_dim_pekerjaan_wali"
    t.index ["penghasilan_ayah_id"], name: "FK_dimx_dim_penghasilan_ayah"
    t.index ["penghasilan_ibu_id"], name: "FK_dimx_dim_penghasilan_ibu"
    t.index ["penghasilan_wali_id"], name: "FK_dimx_dim_penghasilan_wali_id"
    t.index ["ref_kbk_id"], name: "FK_dimx_dim_ref_kbk"
    t.index ["tahun_kurikulum_id"], name: "FK_dimx_dim_thn_krkm"
    t.index ["user_id"], name: "FK_dimx_dim_user"
  end

  create_table "dimx_dim_pmb", primary_key: "dim_pmb_id", id: :integer, force: :cascade do |t|
    t.string "no_umpid", limit: 9, default: "", null: false
    t.integer "tahun_ujian", default: 2004, null: false
    t.string "nim", limit: 8
    t.string "user_name", limit: 7
    t.string "kbk_id", limit: 20, default: "N/A"
    t.string "nama", limit: 50, default: "", null: false
    t.date "tgl_lahir"
    t.string "tempat_lahir", limit: 50
    t.string "gol_darah", limit: 2
    t.string "jenis_kelamin", limit: 1
    t.string "agama", limit: 30
    t.string "alamat"
    t.string "kabupaten", limit: 50
    t.string "kode_pos", limit: 5
    t.string "telepon", limit: 15
    t.string "hp", limit: 20
    t.string "nama_sma", limit: 50
    t.string "no_ijazah_sma", limit: 100
    t.string "alamat_sma", limit: 100
    t.string "kabupaten_sma", limit: 100
    t.string "kodepos_sma", limit: 8
    t.string "telepon_sma", limit: 50
    t.integer "thn_masuk"
    t.string "status_akhir", limit: 1
    t.string "nama_ayah", limit: 50
    t.string "nama_ibu", limit: 50
    t.string "pekerjaan_ayah", limit: 100
    t.string "pekerjaan_ibu", limit: 100
    t.string "nama_wali", limit: 50
    t.string "pekerjaan_wali", limit: 50
    t.string "alamat_wali", limit: 200
    t.string "telepon_wali", limit: 20
    t.string "pendapatan", limit: 50
    t.float "ipk"
    t.binary "foto", size: :long
    t.date "tgl_daftar_s"
    t.date "tgl_daftar_e"
    t.string "status_daftar", limit: 10
    t.integer "n_pembangunan"
    t.bigint "jumlah_pembangunan"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_dim_pmb_t_dim1_idx"
  end

  create_table "dimx_dim_pmb_daftar", primary_key: "dim_pmb_daftar_id", id: :integer, force: :cascade do |t|
    t.string "no_umpid", limit: 9, default: "", null: false
    t.string "nim", limit: 8
    t.datetime "tgl_daftar", precision: nil
    t.float "biaya_bayar", limit: 53
    t.integer "dim_id"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_at", limit: 45
    t.string "updated_at", limit: 45
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.index ["dim_id"], name: "fk_t_dim_pmb_daftar_t_dim1_idx"
    t.index ["no_umpid"], name: "no_umpid_UNIQUE", unique: true
  end

  create_table "dimx_dim_trnon_lulus", primary_key: "dim_trnon_lulus_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.integer "sem_ta", limit: 1, default: 0, null: false
    t.integer "ta", default: 0, null: false
    t.string "status_akhir", limit: 50, default: "Mengundurkan Diri", null: false
    t.date "periode_start"
    t.date "periode_end"
    t.string "no_sk"
    t.date "tanggal_sk"
    t.text "keterangan"
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_dim_trnon_lulus_t_dim1_idx"
  end

  create_table "dimx_dim_update", primary_key: "dim_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8
    t.string "no_usm", limit: 15
    t.string "jalur", limit: 20
    t.string "user_name", limit: 10
    t.string "kbk_id", limit: 20
    t.integer "ref_kbk_id"
    t.string "kpt_prodi", limit: 10
    t.integer "id_kur", default: 0
    t.integer "tahun_kurikulum_id"
    t.string "nama", limit: 50
    t.date "tgl_lahir"
    t.string "tempat_lahir", limit: 50
    t.string "gol_darah", limit: 2
    t.integer "golongan_darah_id"
    t.string "jenis_kelamin", limit: 1
    t.integer "jenis_kelamin_id"
    t.string "agama", limit: 30
    t.integer "agama_id"
    t.string "nik", limit: 16
    t.string "nisn", limit: 10
    t.string "no_kps", limit: 100
    t.text "alamat"
    t.string "kelurahan", limit: 32
    t.integer "kecamatan_id"
    t.string "kabupaten", limit: 50
    t.string "kode_pos", limit: 5
    t.string "email", limit: 50
    t.string "telepon", limit: 50
    t.string "hp", limit: 50
    t.string "hp2", limit: 50
    t.string "no_ijazah_sma", limit: 100
    t.string "nama_sma", limit: 50
    t.integer "asal_sekolah_id"
    t.text "alamat_sma"
    t.string "kabupaten_sma", limit: 100
    t.string "telepon_sma", limit: 50
    t.string "kodepos_sma", limit: 8
    t.integer "thn_masuk"
    t.string "status_akhir", limit: 50
    t.string "nama_ayah", limit: 50
    t.string "nama_ibu", limit: 50
    t.string "nik_ayah", limit: 16
    t.string "nik_ibu", limit: 16
    t.text "tanggal_lahir_ayah"
    t.text "tanggal_lahir_ibu"
    t.string "no_hp_ayah", limit: 50
    t.string "no_hp_ibu", limit: 50
    t.text "alamat_orangtua"
    t.integer "pendidikan_ayah_id"
    t.string "pekerjaan_ayah", limit: 100
    t.integer "pekerjaan_ayah_id"
    t.text "keterangan_pekerjaan_ayah"
    t.string "penghasilan_ayah", limit: 50
    t.integer "penghasilan_ayah_id"
    t.integer "pendidikan_ibu_id"
    t.string "pekerjaan_ibu", limit: 100
    t.integer "pekerjaan_ibu_id"
    t.text "keterangan_pekerjaan_ibu"
    t.string "penghasilan_ibu", limit: 50
    t.integer "penghasilan_ibu_id"
    t.string "nama_wali", limit: 50
    t.date "tanggal_lahir_wali"
    t.integer "pendidikan_wali_id"
    t.string "pekerjaan_wali", limit: 50
    t.integer "pekerjaan_wali_id"
    t.text "keterangan_pekerjaan_wali"
    t.string "penghasilan_wali", limit: 50
    t.integer "penghasilan_wali_id"
    t.text "alamat_wali"
    t.string "telepon_wali", limit: 20
    t.string "no_hp_wali", limit: 50
    t.string "pendapatan", limit: 50
    t.float "ipk", default: 0.0
    t.integer "anak_ke", limit: 1
    t.integer "dari_jlh_anak", limit: 1
    t.integer "jumlah_tanggungan", limit: 1
    t.float "nilai_usm"
    t.integer "score_iq", limit: 1
    t.string "rekomendasi_psikotest", limit: 4
    t.string "foto", limit: 50
    t.string "kode_foto", limit: 100
    t.text "catatan"
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["agama_id"], name: "FK_dimx_dim_agama"
    t.index ["asal_sekolah_id"], name: "FK_dimx_dim_asal_sekolah"
    t.index ["golongan_darah_id"], name: "FK_dimx_dim_golongan_darah"
    t.index ["jenis_kelamin_id"], name: "FK_dimx_dim_jenis_kelamin"
    t.index ["nim"], name: "NIM"
    t.index ["nim"], name: "NIM_UNIQUE", unique: true
    t.index ["pekerjaan_ayah_id"], name: "FK_dimx_dim_pekerjaan_ayah"
    t.index ["pekerjaan_ibu_id"], name: "FK_dimx_dim_pekerjaan_ibu"
    t.index ["pekerjaan_wali_id"], name: "FK_dimx_dim_pekerjaan_wali"
    t.index ["penghasilan_ayah_id"], name: "FK_dimx_dim_penghasilan_ayah"
    t.index ["penghasilan_ibu_id"], name: "FK_dimx_dim_penghasilan_ibu"
    t.index ["penghasilan_wali_id"], name: "FK_dimx_dim_penghasilan_wali_id"
    t.index ["ref_kbk_id"], name: "FK_dimx_dim_ref_kbk"
    t.index ["tahun_kurikulum_id"], name: "FK_dimx_dim_thn_krkm"
    t.index ["user_id"], name: "FK_dimx_dim_user"
  end

  create_table "dimx_histori_prodi", primary_key: "histori_prodi_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.string "nim_old", limit: 8
    t.integer "ref_kbk_id_old"
    t.string "username_old", limit: 20
    t.string "email_old", limit: 30
    t.string "tahun_pindah", limit: 4, null: false
    t.integer "sem_ta_pindah", null: false
    t.date "tgl_pindah", null: false
    t.string "nim_new", limit: 8, null: false
    t.integer "ref_kbk_id_new", null: false
    t.string "username_new", limit: 20, null: false
    t.string "email_new", limit: 30, null: false
    t.integer "kelas_new"
    t.integer "wali_new"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["dim_id"], name: "FK_dimx_histori_prodi"
  end

  create_table "feeder_aktivitas_kegiatan", primary_key: "aktivitas_kegiatan_id", id: :integer, force: :cascade do |t|
    t.integer "aktivitas_id", comment: "dari akmx_aktivitas_kegiatan"
    t.string "id_aktivitas", limit: 100, comment: "dari feeder"
    t.string "id_prodi", limit: 100, comment: "dari feeder"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "feeder_data", id: :integer, force: :cascade do |t|
    t.string "key", limit: 225
    t.text "value"
    t.string "updated_by", limit: 45
    t.string "created_by", limit: 45
    t.date "updated_at"
    t.date "created_at"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 45
    t.date "deleted_at"
  end

  create_table "feeder_dosen", primary_key: "id_dosen", id: { type: :string, limit: 225 }, force: :cascade do |t|
    t.string "nama_dosen", limit: 225
    t.string "nidn", limit: 225
    t.string "jenis_kelamin", limit: 225
    t.integer "id_agama"
    t.string "tanggal_lahir", limit: 225
    t.integer "id_status_aktif"
    t.string "nama_status_aktif", limit: 225
    t.string "nip", limit: 225
    t.date "created_at"
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.string "deleted_by", limit: 45
    t.date "updated_at"
    t.date "deleted_at"
    t.boolean "deleted", default: false
  end

  create_table "feeder_jenis_aktivitas", primary_key: "jenis_aktivitas_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.boolean "is_mbkm"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "feeder_kategori_kegiatan_dosen", primary_key: "kategori_kegiatan_dosen_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "feeder_mahasiswa", primary_key: "id_mahasiswa", id: { type: :string, limit: 50 }, force: :cascade do |t|
    t.string "id_registrasi_mahasiswa", limit: 50
    t.string "id_prodi", limit: 50
    t.string "jenis_kelamin", limit: 1
    t.string "nama_mahasiswa", limit: 100
    t.string "nim_cis", limit: 50
    t.integer "dim_id"
    t.string "id_periode", limit: 5
    t.string "nim_feeder", limit: 20
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 35
    t.date "deleted_at"
    t.date "created_at"
    t.date "updated_at"
    t.string "nama_status_mahasiswa", limit: 50
    t.string "nama_program_studi", limit: 100
  end

  create_table "feeder_matkul", primary_key: "id_matkul", id: { type: :string, limit: 100 }, force: :cascade do |t|
    t.string "kode_mata_kuliah", limit: 100
    t.string "nama_mata_kuliah", limit: 200
    t.string "sks_mata_kuliah", limit: 10
    t.string "id_prodi", limit: 100
    t.string "nama_program_studi", limit: 200
    t.string "id_kelompok_mata_kuliah", limit: 5
    t.string "id_jenis_mata_kuliah", limit: 5
    t.boolean "deleted", default: false
    t.date "created_at"
    t.date "deleted_at"
    t.date "updated_at"
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.string "deleted_by", limit: 32
    t.integer "kuliah_id"
  end

  create_table "feeder_prodi", primary_key: "prodi_id", id: { type: :string, limit: 100 }, force: :cascade do |t|
    t.string "kode_program_studi", limit: 10
    t.string "nama_program_studi", limit: 100
    t.string "status", limit: 5
    t.string "id_jenjang_pendidikan", limit: 5
    t.string "nama_jenjang_pendidikan", limit: 5
    t.integer "ref_kbk_id"
    t.integer "deleted", default: 0
    t.date "created_at"
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.date "updated_at"
    t.date "deleted_at"
    t.string "deteled_by", limit: 32
  end

  create_table "hrdx_dosen", primary_key: "dosen_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.string "nidn", limit: 10
    t.integer "prodi_id"
    t.integer "golongan_kepangkatan_id"
    t.integer "jabatan_akademik_id"
    t.integer "status_ikatan_kerja_dosen_id"
    t.integer "gbk_1"
    t.integer "gbk_2"
    t.date "aktif_start"
    t.date "aktif_end"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "temp_id_old", limit: 100
    t.index ["gbk_1"], name: "FK_hrdx_dosen_gbk"
    t.index ["gbk_2"], name: "FK_hrdx_dosen_gbk2"
    t.index ["golongan_kepangkatan_id"], name: "FK_hrdx_dosen"
    t.index ["jabatan_akademik_id"], name: "FK_hrdx_dosen_jab"
    t.index ["pegawai_id"], name: "FK_hrdx_dosen_pegawai"
    t.index ["prodi_id"], name: "FK_hrdx_dosen_prodi"
    t.index ["status_ikatan_kerja_dosen_id"], name: "FK_hrdx_dosen_stts"
  end

  create_table "hrdx_karyawan_lapangan", primary_key: "karyawan_lapangan_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.string "nitk", limit: 10
    t.integer "karyawan_lapangan_role_id"
    t.date "aktif_start"
    t.date "aktif_end"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["karyawan_lapangan_role_id"], name: "FK_hrdx_staf_role"
    t.index ["pegawai_id"], name: "FK_hrdx_staf_pegawai"
  end

  create_table "hrdx_pegawai", primary_key: "pegawai_id", id: :integer, force: :cascade do |t|
    t.string "profile_old_id", limit: 20
    t.string "nama", limit: 135
    t.string "user_name", limit: 100
    t.string "nip", limit: 45
    t.string "kpt_no", limit: 10
    t.string "kbk_id", limit: 20
    t.integer "ref_kbk_id"
    t.string "alias", limit: 9
    t.string "posisi", limit: 100
    t.string "tempat_lahir", limit: 60
    t.date "tgl_lahir"
    t.integer "agama_id"
    t.integer "jenis_kelamin_id"
    t.integer "golongan_darah_id"
    t.string "hp", limit: 20
    t.string "telepon", limit: 45
    t.binary "alamat"
    t.string "alamat_libur", limit: 100
    t.string "kecamatan", limit: 150
    t.string "kota", limit: 50
    t.integer "kabupaten_id"
    t.string "kode_pos", limit: 15
    t.string "no_ktp"
    t.text "email"
    t.string "ext_num", limit: 3
    t.string "study_area_1", limit: 50
    t.string "study_area_2", limit: 50
    t.string "jabatan", limit: 1
    t.integer "jabatan_akademik_id"
    t.integer "gbk_1"
    t.integer "gbk_2"
    t.integer "status_ikatan_kerja_pegawai_id"
    t.string "status_akhir", limit: 1
    t.integer "status_aktif_pegawai_id"
    t.date "tanggal_masuk"
    t.date "tanggal_keluar"
    t.string "nama_bapak", limit: 50
    t.string "nama_ibu", limit: 50
    t.string "status", limit: 1
    t.integer "status_marital_id"
    t.string "nama_p", limit: 50
    t.date "tgl_lahir_p"
    t.string "tmp_lahir_p", limit: 50
    t.string "pekerjaan_ortu", limit: 100
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["agama_id"], name: "FK_hrdx_pegawai_agama"
    t.index ["golongan_darah_id"], name: "FK_hrdx_pegawai_golda"
    t.index ["jabatan_akademik_id"], name: "FK_hrdx_pegawai_jabatan_akademik"
    t.index ["jenis_kelamin_id"], name: "FK_hrdx_pegawai_JK"
    t.index ["kabupaten_id"], name: "FK_hrdx_pegawai_kab"
    t.index ["ref_kbk_id"], name: "FK_hrdx_pegawai_kbk"
    t.index ["status_aktif_pegawai_id"], name: "FK_hrdx_pegawai_sts_aktf"
    t.index ["status_ikatan_kerja_pegawai_id"], name: "FK_hrdx_pegawai_sts_iktn"
    t.index ["status_marital_id"], name: "FK_hrdx_pegawai_sts_martl"
    t.index ["user_id"], name: "FK_hrdx_pegawai_user"
  end

  create_table "hrdx_pendidikan", primary_key: "pendidikan_id", id: :integer, force: :cascade do |t|
    t.string "id", limit: 20, default: "", null: false
    t.integer "no", null: false
    t.string "jenjang", limit: 40
    t.string "gelar", limit: 10
    t.string "universitas", limit: 100
    t.string "progdi", limit: 200
    t.string "bidang", limit: 200
    t.date "thn_masuk"
    t.date "thn_lulus"
    t.string "judul_ta"
    t.float "ipk"
    t.integer "profile_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["profile_id"], name: "fk_t_pendidikan_t_profile1_idx"
  end

  create_table "hrdx_pengajar", primary_key: "pengajar_id", id: :integer, force: :cascade do |t|
    t.integer "ta", default: 0, null: false
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "id", limit: 20, null: false
    t.string "role", limit: 1, default: "", null: false
    t.integer "kurikulum_id"
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_id"], name: "fk_t_pengajar_t_kurikulum1_idx"
    t.index ["pegawai_id"], name: "FK_hrdx_pengajar"
  end

  create_table "hrdx_profile", primary_key: "profile_id", id: :integer, force: :cascade do |t|
    t.string "id", limit: 20, default: "", null: false
    t.string "nip", limit: 20, default: "", null: false
    t.string "kpt_no", limit: 10, default: "", null: false
    t.string "user_name", limit: 20
    t.string "nama", limit: 50, default: "", null: false
    t.string "posisi", limit: 100
    t.string "alias", limit: 5
    t.date "tgl_lahir"
    t.string "tempat_lahir", limit: 50
    t.string "jenis_kelamin", limit: 1, default: "", null: false
    t.string "gol_darah", limit: 2
    t.date "tgl_masuk"
    t.date "tgl_keluar", null: false
    t.string "agama", limit: 30
    t.string "kbk_id", limit: 20
    t.string "ext_num", limit: 3
    t.string "hp", limit: 20
    t.string "email"
    t.string "alamat_libur", limit: 100
    t.string "kota", limit: 50
    t.string "kode_pos", limit: 5
    t.string "telepon", limit: 15
    t.string "ktp"
    t.string "pendidikan"
    t.string "jabatan", limit: 20, default: "", null: false
    t.string "pendidikan_tertinggi", limit: 20, default: "S1", null: false
    t.string "study_area1", limit: 50, default: "", null: false
    t.string "study_area2", limit: 50, default: "", null: false
    t.string "status", limit: 1, default: "S", null: false
    t.string "nama_bapak", limit: 50
    t.string "nama_ibu", limit: 50
    t.string "pekerjaan_ortu", limit: 100
    t.string "nama_p", limit: 50
    t.string "tmp_lahir_p", limit: 50
    t.date "tgl_lahir_p", null: false
    t.text "ket", null: false
    t.string "status_akhir", limit: 5, default: "A", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["nama"], name: "NAMA"
    t.index ["profile_id"], name: "ID"
  end

  create_table "hrdx_r_karyawan_lapangan_role", primary_key: "karyawan_lapangan_role_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 100
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "hrdx_r_staf_role", primary_key: "staf_role_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 100
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "hrdx_riwayat_pendidikan", primary_key: "riwayat_pendidikan_id", id: :integer, force: :cascade do |t|
    t.integer "jenjang_id"
    t.string "universitas", limit: 100
    t.string "jurusan", limit: 200
    t.string "thn_mulai", limit: 50
    t.string "thn_selesai", limit: 50
    t.string "ipk", limit: 15
    t.string "gelar", limit: 15
    t.string "judul_ta"
    t.integer "pegawai_id"
    t.string "website"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.integer "profile_id"
    t.string "jenjang", limit: 40
    t.string "id_old", limit: 20
    t.index ["jenjang_id"], name: "FK_hrdx_riwayat_pendidikan_new_jenjang"
    t.index ["pegawai_id"], name: "FK_hrdx_riwayat_pendidikan_new_pegawai"
    t.index ["profile_id"], name: "fk_t_pendidikan_t_profile1_idx"
  end

  create_table "hrdx_riwayat_pendidikan_old", id: false, force: :cascade do |t|
    t.integer "riwayat_pendidikan_id"
    t.integer "jenjang_id"
    t.string "universitas", limit: 180
    t.string "jurusan", limit: 150
    t.string "thn_mulai", limit: 150
    t.string "thn_selesai", limit: 150
    t.string "ipk", limit: 15
    t.string "gelar", limit: 15
    t.integer "dosen_id"
    t.integer "staf_id"
    t.binary "judul_ta"
    t.string "website", limit: 765
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 96
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 96
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 96
    t.index ["dosen_id"], name: "FK_hrdx_riwayat_pendidikan_dosen"
    t.index ["jenjang_id"], name: "FK_hrdx_riwayat_pendidikan_jenjang"
    t.index ["staf_id"], name: "FK_hrdx_riwayat_pendidikan_staf"
  end

  create_table "hrdx_staf", primary_key: "staf_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.string "nitk", limit: 10
    t.integer "prodi_id"
    t.integer "staf_role_id"
    t.date "aktif_start"
    t.date "aktif_end"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "temp_id_old", limit: 100
    t.index ["pegawai_id"], name: "FK_hrdx_staf_pegawai"
    t.index ["prodi_id"], name: "FK_hrdx_staf_prodi"
    t.index ["staf_role_id"], name: "FK_hrdx_staf_role"
  end

  create_table "inst_fakultas", primary_key: "fakultas_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.text "desc"
    t.string "desc_eng", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "inst_instansi", primary_key: "instansi_id", id: :integer, force: :cascade do |t|
    t.string "name"
    t.string "inisial", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.binary "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "inst_pejabat", primary_key: "pejabat_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.integer "struktur_jabatan_id"
    t.date "awal_masa_kerja"
    t.date "akhir_masa_kerja"
    t.string "no_sk", limit: 45
    t.text "file_sk"
    t.string "kode_file", limit: 200
    t.boolean "status_aktif", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.binary "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["pegawai_id"], name: "FK_inst_pejabat_pegawai"
    t.index ["struktur_jabatan_id"], name: "FK_pejabat_struktur_jabatan_idx"
  end

  create_table "inst_prodi", primary_key: "ref_kbk_id", id: :integer, force: :cascade do |t|
    t.string "kbk_id", limit: 20
    t.string "kpt_id", limit: 10
    t.integer "jenjang_id"
    t.string "kbk_ind", limit: 100
    t.string "singkatan_prodi", limit: 50
    t.string "kbk_ing", limit: 100
    t.string "nama_kopertis_ind"
    t.string "nama_kopertis_ing"
    t.string "short_desc_ind"
    t.string "short_desc_ing"
    t.text "desc_ind"
    t.text "desc_ing"
    t.boolean "status", default: true
    t.boolean "is_jenjang_all", default: true
    t.boolean "is_public", default: true
    t.boolean "is_hidden", default: false
    t.integer "fakultas_id"
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["fakultas_id"], name: "fk_inst_fakultas_inst_prodi"
    t.index ["jenjang_id"], name: "FK_krkm_r_kbk"
    t.index ["kbk_id"], name: "KBK_ID_UNIQUE", unique: true
  end

  create_table "inst_r_jenjang", primary_key: "jenjang_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 15
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "inst_struktur_jabatan", primary_key: "struktur_jabatan_id", id: :integer, force: :cascade do |t|
    t.integer "instansi_id"
    t.string "jabatan"
    t.integer "parent"
    t.string "inisial", limit: 45
    t.boolean "is_multi_tenant", default: false
    t.boolean "mata_anggaran", default: false
    t.boolean "laporan", default: false
    t.integer "unit_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.binary "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["instansi_id"], name: "FK_struktur_jabatan_instansi_idx"
    t.index ["parent"], name: "FK_struktur_jabatan_struktur_jabatan_idx"
    t.index ["unit_id"], name: "FK_struktur_jabatan_unit_idx"
  end

  create_table "inst_unit", primary_key: "unit_id", id: :integer, force: :cascade do |t|
    t.integer "instansi_id"
    t.string "name"
    t.string "inisial", limit: 45
    t.text "desc"
    t.integer "kepala"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.binary "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["instansi_id"], name: "FK_unit_instansi_idx"
    t.index ["kepala"], name: "FK_unit_struktur_jabatan_idx"
  end

  create_table "invt_arsip_vendor", primary_key: "arsip_vendor_id", id: :integer, force: :cascade do |t|
    t.integer "vendor_id"
    t.string "judul_arsip", limit: 150
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["vendor_id"], name: "FK_invt_arsip_vendor"
  end

  create_table "invt_barang", primary_key: "barang_id", id: :integer, force: :cascade do |t|
    t.string "nama_barang", limit: 200
    t.string "serial_number", limit: 100
    t.integer "jenis_barang_id"
    t.integer "kategori_id"
    t.integer "brand_id"
    t.integer "jumlah", default: 0
    t.string "supplier", limit: 150
    t.integer "vendor_id"
    t.decimal "harga_per_barang", precision: 10
    t.decimal "total_harga", precision: 10, default: "0"
    t.date "tanggal_masuk"
    t.integer "satuan_id"
    t.text "desc"
    t.string "kapasitas", limit: 50
    t.string "nama_file", limit: 200
    t.string "kode_file", limit: 200
    t.integer "unit_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["brand_id"], name: "FK_invt_barang_brand"
    t.index ["jenis_barang_id"], name: "FK_invt_barang"
    t.index ["kategori_id"], name: "FK_invt_barang_kategori"
    t.index ["satuan_id"], name: "FK_invt_barang_satuan"
    t.index ["unit_id"], name: "FK_invt_barang_unit"
    t.index ["vendor_id"], name: "FK_invt_barang_vendor"
  end

  create_table "invt_detail_peminjaman_barang", primary_key: "detail_peminjaman_barang_id", id: :integer, force: :cascade do |t|
    t.integer "peminjaman_barang_id"
    t.integer "barang_id"
    t.integer "jumlah"
    t.integer "jumlah_rusak", default: 0
    t.index ["barang_id"], name: "FK_invt_detail_peminjaman_barang_barang"
    t.index ["peminjaman_barang_id"], name: "FK_invt_detail_peminjaman_barang"
  end

  create_table "invt_file_vendor", primary_key: "file_vendor_id", id: :integer, force: :cascade do |t|
    t.integer "arsip_vendor_id"
    t.string "nama_file", limit: 250
    t.string "kode_file", limit: 250
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["arsip_vendor_id"], name: "FK_invt_file_vendor"
  end

  create_table "invt_keterangan_pengeluaran", primary_key: "keterangan_pengeluaran_id", id: :integer, force: :cascade do |t|
    t.date "tgl_keluar", null: false
    t.integer "unit_id"
    t.text "keterangan", null: false
    t.integer "total_barang_keluar", default: 0
    t.integer "oleh"
    t.integer "lokasi_distribusi"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "invt_pelaporan_barang_rusak", primary_key: "pelaporan_barang_rusak", id: :integer, force: :cascade do |t|
    t.integer "barang_id"
    t.string "kode_barang", limit: 150
    t.integer "pelapor"
    t.integer "jumlah_rusak", default: 0
    t.date "tgl_lapor"
    t.text "deskripsi"
    t.string "nama_file", limit: 200
    t.boolean "status_perbaikan", default: false
    t.date "tgl_perbaikan"
    t.string "kode_file", limit: 200
    t.integer "unit_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["barang_id"], name: "FK_invt_barang_rusak"
    t.index ["pelapor"], name: "FK_invt_barang_rusak_pelapor"
    t.index ["unit_id"], name: "FK_invt_pelaporan_barang_rusak_unit"
  end

  create_table "invt_pemindahan_barang", primary_key: "pemindahan_barang_id", id: :integer, force: :cascade do |t|
    t.integer "pengeluaran_barang_id"
    t.integer "lokasi_awal_id"
    t.string "kode_inventori_awal", limit: 50
    t.integer "lokasi_akhir_id"
    t.string "kode_inventori", limit: 50
    t.date "tanggal_pindah"
    t.integer "oleh"
    t.string "status_transaksi", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["pengeluaran_barang_id"], name: "FK_invt_pemindahan_barang"
  end

  create_table "invt_peminjaman_barang", primary_key: "peminjaman_barang_id", id: :integer, force: :cascade do |t|
    t.date "tgl_pinjam"
    t.date "tgl_kembali"
    t.integer "oleh"
    t.text "deskripsi"
    t.integer "unit_id"
    t.integer "status_approval", default: 0, comment: "0: belum; 1:sudah; 2:reject"
    t.integer "approved_by"
    t.boolean "status_kembali", default: false
    t.date "tgl_realisasi_kembali"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["approved_by"], name: "FK_invt_peminjaman_approved_by"
    t.index ["oleh"], name: "FK_invt_peminjaman_oleh"
    t.index ["status_approval"], name: "FK_invt_peminjaman_barang_status_approval"
    t.index ["unit_id"], name: "FK_invt_peminjaman_barang_unit"
  end

  create_table "invt_pengeluaran_barang", primary_key: "pengeluaran_barang_id", id: :integer, force: :cascade do |t|
    t.integer "keterangan_pengeluaran_id"
    t.integer "barang_id"
    t.string "kode_inventori", limit: 120
    t.integer "unit_id"
    t.integer "jumlah", default: 0
    t.integer "lokasi_id"
    t.date "tgl_keluar"
    t.string "status_akhir", limit: 50, default: "DISTRIBUSI", comment: "0:distribusi, 1:pindah, 2: pinjam, 3: rusak, 4: musnah"
    t.boolean "is_has_pic", default: false, comment: "0: no, 1: yes"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.binary "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["barang_id"], name: "FK_invt_detail_pengeluaran_barang_barang"
    t.index ["keterangan_pengeluaran_id"], name: "FK_invt_pengeluaran_barang_keterangan"
    t.index ["lokasi_id"], name: "FK_invt_pengeluaran_barang"
    t.index ["status_akhir"], name: "FK_invt_pengeluaran_barang_STATUS"
  end

  create_table "invt_pic_barang", primary_key: "pic_barang_id", id: :integer, force: :cascade do |t|
    t.integer "pengeluaran_barang_id", comment: "id distribusi barang"
    t.integer "pegawai_id", comment: "pegawai PIC barang"
    t.date "tgl_assign"
    t.text "keterangan"
    t.boolean "is_unassign", default: false
    t.date "tgl_unassign"
    t.integer "unit_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["pegawai_id"], name: "FK_invt_pic_barang_pegawai"
    t.index ["pengeluaran_barang_id"], name: "FK_invt_pic_barang"
  end

  create_table "invt_pic_barang_file", primary_key: "pic_barang_file_id", id: :integer, force: :cascade do |t|
    t.string "nama_file", limit: 250
    t.string "kode_file", limit: 250
    t.integer "pic_barang_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["pic_barang_id"], name: "FK_invt_pic_barang_file"
  end

  create_table "invt_r_brand", primary_key: "brand_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 200
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "invt_r_jenis_barang", primary_key: "jenis_barang_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 150
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "invt_r_kategori", primary_key: "kategori_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 150
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "invt_r_lokasi", primary_key: "lokasi_id", id: :integer, force: :cascade do |t|
    t.integer "parent_id", default: 0
    t.string "nama_lokasi", limit: 50
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "invt_r_satuan", primary_key: "satuan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 150
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "invt_r_status", primary_key: "status_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 150, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["nama"], name: "status_unique", unique: true
  end

  create_table "invt_r_unit", primary_key: "unit_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 100
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "invt_r_vendor", primary_key: "vendor_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 150
    t.string "telp", limit: 15
    t.string "email", limit: 100
    t.string "alamat", limit: 150, null: false
    t.string "link", limit: 250
    t.string "contact_person", limit: 200
    t.string "telp_contact_person", limit: 15
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "invt_summary_jumlah", primary_key: "summary_jumlah_id", id: :integer, force: :cascade do |t|
    t.integer "barang_id", null: false
    t.integer "kategori_id", null: false
    t.integer "total_jumlah"
    t.integer "jumlah_distribusi", default: 0
    t.integer "jumlah_gudang", default: 0
    t.integer "jumlah_rusak", default: 0
    t.integer "jumlah_pinjam", default: 0
    t.integer "jumlah_musnah", default: 0
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["barang_id"], name: "FK_invt_summary_jumlah"
  end

  create_table "invt_unit_charged", primary_key: "unit_charged_id", id: :integer, force: :cascade do |t|
    t.integer "unit_id"
    t.integer "user_id"
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["unit_id"], name: "FK_invt_unit_user_unit"
    t.index ["user_id"], name: "FK_invt_unit_user_user"
  end

  create_table "jdwl_jadwal", primary_key: "jadwal_id", id: :integer, force: :cascade do |t|
    t.integer "ta", default: 0
    t.integer "sem_ta", default: 0
    t.integer "kuliah_id", null: false
    t.boolean "type", default: true
    t.integer "kelas_id", null: false
    t.integer "hari_id", null: false
    t.integer "lokasi_id", null: false
    t.integer "successor"
    t.integer "predecessor"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["kelas_id"], name: "kelas_id_constraint"
    t.index ["kuliah_id"], name: "kuliah_id_constraint"
    t.index ["lokasi_id"], name: "lokasi_id_constraint"
    t.index ["predecessor"], name: "predeccessor_constraint"
    t.index ["successor"], name: "successor_constraint"
  end

  create_table "jdwl_jadwal_sesi", primary_key: "jadwal_sesi_id", id: :integer, force: :cascade do |t|
    t.integer "jadwal_id"
    t.integer "sesi_id"
    t.integer "sesi_order", default: 0
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["jadwal_id"], name: "jadwal_id_constraint"
    t.index ["sesi_id"], name: "sesi_id_constraint"
  end

  create_table "jdwl_r_sesi", primary_key: "sesi_id", id: :integer, force: :cascade do |t|
    t.integer "name"
    t.time "start"
    t.time "end"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "jdwl_week", primary_key: "week_id", id: :integer, force: :cascade do |t|
    t.integer "sem_ta"
    t.integer "ta"
    t.integer "week"
    t.date "start_date"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.index ["week_id"], name: "week_id"
  end

  create_table "kasus", id: false, force: :cascade do |t|
    t.string "kecamatan"
    t.string "kelurahan", limit: 45
    t.text "jumlah_kasus"
  end

  create_table "kmhs_detail_kasus", primary_key: "detail_kasus_id", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.integer "dim_id", null: false
    t.date "tgl_kasus", null: false
    t.string "jenis_kasus", limit: 20, default: "", null: false
    t.text "deskripsi"
    t.string "no_form", limit: 20
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_detail_kasus_t_dim1_idx"
  end

  create_table "kmhs_master_kasus", primary_key: "master_kasus", id: :integer, force: :cascade do |t|
    t.string "nim", limit: 8, default: "", null: false
    t.string "no_sp1", limit: 50, default: "", null: false
    t.date "tgl_sp1", null: false
    t.text "uraian_sp1"
    t.string "no_sp2", limit: 50
    t.date "tgl_sp2"
    t.text "uraian_sp2"
    t.string "no_sk", limit: 50
    t.date "tgl_sk"
    t.text "uraian_sk"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.integer "dim_id", null: false
    t.index ["dim_id"], name: "fk_t_master_kasus_t_dim1_idx"
    t.index ["nim"], name: "NIM_UNIQUE", unique: true
  end

  create_table "kmhs_nilai_perilaku", primary_key: "nilai_perilaku_id", id: :integer, force: :cascade do |t|
    t.string "ta", limit: 30, null: false
    t.integer "sem_ta", null: false
    t.integer "bulan", null: false
    t.string "nim", limit: 8, null: false
    t.string "kriteria", limit: 4, null: false
    t.integer "nilai"
    t.integer "kriteria_nilai_perilaku_id"
    t.integer "dim_id"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_perilaku_t_dim1_idx"
    t.index ["kriteria"], name: "KRITERIA"
    t.index ["kriteria_nilai_perilaku_id"], name: "fk_t_nilai_perilaku_t_kriteria_nilai_perilaku1_idx"
    t.index ["nim"], name: "NIM"
  end

  create_table "kmhs_nilai_perilaku_arsip", primary_key: "nilai_perilaku_arsip_id", id: :integer, force: :cascade do |t|
    t.string "ta", limit: 30, null: false
    t.integer "sem_ta", null: false
    t.integer "bulan", null: false
    t.string "nim", limit: 8, null: false
    t.integer "dim_id"
    t.string "kriteria", limit: 4, null: false
    t.integer "kriteria_nilai_perilaku_id"
    t.integer "nilai"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_perilaku_arsip_t_dim1_idx"
    t.index ["kriteria"], name: "KRITERIA"
    t.index ["kriteria_nilai_perilaku_id"], name: "fk_t_nilai_perilaku_arsip_t_kriteria_nilai_perilaku1_idx"
    t.index ["nim"], name: "NIM"
  end

  create_table "kmhs_nilai_perilaku_as", primary_key: "nilai_perilaku_as_id", id: :integer, force: :cascade do |t|
    t.string "ta", limit: 30, null: false
    t.integer "sem_ta", null: false
    t.string "nim", limit: 8, null: false
    t.string "k1", limit: 11, comment: "Kebersihan Kamar TIdur/Tempat Tidur"
    t.string "k2", limit: 11, comment: "Kerapian Kamar/Tempat Tidur"
    t.string "k3", limit: 11, comment: "Kerapian Almari"
    t.string "k4", limit: 11, comment: "Ketepatan Waktu Keluar/Masuk Kampus"
    t.string "k5", limit: 11, comment: "Ketepatan Waktu Hadir Kuliah"
    t.string "K6", limit: 11, comment: "Kehadiran Saat Makan Pagi"
    t.string "k7", limit: 11, comment: "Kehadiran Saat Makan Siang"
    t.string "k8", limit: 11, comment: "Kehadiran Saat Makan Malam"
    t.string "k9", limit: 11, comment: "Kedisiplinan"
    t.string "k10", limit: 11, comment: "Ketertiban"
    t.string "k11", limit: 11, comment: "Intens Pemanggilan Karena Bermasalah"
    t.string "k12", limit: 11, comment: "Perilaku/Sikap"
    t.string "na", limit: 11
    t.string "grade", limit: 2
    t.text "catatan"
    t.integer "dim_id"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_perilaku_as_t_dim1_idx"
  end

  create_table "kmhs_nilai_perilaku_summary", primary_key: "nilai_perilaku_summary_id", id: :integer, force: :cascade do |t|
    t.string "ta", limit: 30, null: false
    t.integer "sem_ta", null: false
    t.string "nim", limit: 8, null: false
    t.integer "dim_id"
    t.integer "na"
    t.string "grade", limit: 2
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_perilaku_summary_t_dim1_idx"
  end

  create_table "kmhs_nilai_perilaku_ts", primary_key: "nilai_perilaku_ts", id: :integer, force: :cascade do |t|
    t.string "ta", limit: 30, null: false
    t.integer "sem_ta", null: false
    t.string "nim", limit: 8, null: false
    t.string "k1", limit: 11, comment: "Kebersihan"
    t.string "k2", limit: 11, comment: "Kerapian Kamar"
    t.string "k3", limit: 11, comment: "Kerapian Almari"
    t.string "k4", limit: 11, comment: "Ketepatan Waktu Keluar/Masuk Kampus"
    t.string "k5", limit: 11, comment: "Kejujuran"
    t.string "k6", limit: 11, comment: "Kehadiran saat makan pagi"
    t.string "k7", limit: 11, comment: "Kehadiran saat makan siang"
    t.string "k8", limit: 11, comment: "Kehadiran saat makan malam"
    t.string "k9", limit: 11, comment: "Kedisiplinan"
    t.string "k10", limit: 11, comment: "Ketertiban"
    t.string "k11", limit: 11, comment: "Intens"
    t.string "k12", limit: 11, comment: "Perilaku/Sikap"
    t.integer "na"
    t.string "grade", limit: 2
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_perilaku_ts_t_dim1_idx"
  end

  create_table "kmhs_r_kasus", primary_key: "ref_kasus_id", id: :integer, force: :cascade do |t|
    t.string "id_kasus", limit: 20, default: "", null: false
    t.text "deskripsi"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "kmhs_r_kriteria_nilai_perilaku", primary_key: "kriteria_nilai_perilaku_id", id: :integer, force: :cascade do |t|
    t.string "kriteria", limit: 4, null: false
    t.string "deskripsi", limit: 50, null: false
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kriteria"], name: "KRITERIA_UNIQUE", unique: true
  end

  create_table "kolb_buku", primary_key: "buku_id", id: :integer, force: :cascade do |t|
    t.text "judul", null: false
    t.text "subjudul"
    t.text "desc"
    t.integer "pegawai_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["pegawai_id"], name: "fk_buku_pegawai"
  end

  create_table "kolb_komponen", primary_key: "komponen_id", id: :integer, force: :cascade do |t|
    t.integer "buku_id", null: false
    t.integer "parent"
    t.string "indeks", limit: 50
    t.text "judul"
    t.string "konten", limit: 100
    t.string "konten_file", limit: 100
    t.text "desc"
    t.integer "order", default: 0
    t.integer "status_id", default: 1
    t.integer "pegawai_id"
    t.text "review"
    t.boolean "dinilai", default: false
    t.float "nilai_assesor", default: 0.0
    t.float "progress_konten", default: 0.0
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["buku_id"], name: "fk_komponen_buku"
    t.index ["parent"], name: "fk_komponen_komponen"
    t.index ["pegawai_id"], name: "fk_komponen_pegawai"
    t.index ["status_id"], name: "fk_komponen_status"
  end

  create_table "kolb_lampiran", primary_key: "lampiran_id", id: :integer, force: :cascade do |t|
    t.integer "komponen_id", null: false
    t.string "name", limit: 100
    t.string "alias", limit: 100
    t.string "kode_file", limit: 100
    t.text "desc"
    t.integer "kategori_lampiran_id"
    t.boolean "published", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["kategori_lampiran_id"], name: "fk_lampiran_kategori_lampiran"
    t.index ["komponen_id"], name: "fk_lampiran_komponen"
  end

  create_table "kolb_penilai", primary_key: "penilai_id", id: :integer, force: :cascade do |t|
    t.integer "komponen_id"
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["komponen_id"], name: "kolb_penilai_komponen_fk_2"
    t.index ["pegawai_id"], name: "kolb_penilai_pegawai_fk_3"
  end

  create_table "kolb_penulis", primary_key: "penulis_id", id: :integer, force: :cascade do |t|
    t.integer "komponen_id", null: false
    t.integer "pegawai_id", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["komponen_id"], name: "fk_penulis_komponen"
    t.index ["pegawai_id"], name: "fk_penulis_pegawai"
  end

  create_table "kolb_r_kategori_lampiran", primary_key: "kategori_lampiran_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.text "desc"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "kolb_r_status", primary_key: "status_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "krkm_course_group", primary_key: "course_group_id", id: :integer, force: :cascade do |t|
    t.string "id", limit: 20, default: "", null: false
    t.string "eng", default: "", null: false
    t.string "ina"
    t.string "kpt_kode", limit: 10, default: "", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["id"], name: "ID_UNIQUE", unique: true
  end

  create_table "krkm_kuliah", primary_key: "kuliah_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 2001, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "nama_kul_ind"
    t.string "nama_kul_ing"
    t.string "short_name", limit: 20
    t.string "kbk_id", limit: 20, default: "0"
    t.string "course_group", limit: 20
    t.integer "sks", limit: 2
    t.integer "sem", limit: 2
    t.integer "urut_dlm_sem", limit: 2
    t.integer "sifat", limit: 2
    t.string "meetings", limit: 100
    t.string "tipe", limit: 25
    t.string "level", limit: 15
    t.text "key_topics_ind"
    t.text "key_topics_ing"
    t.text "objektif_ind"
    t.text "objektif_ing"
    t.integer "lab_hour", limit: 1
    t.integer "tutorial_hour", limit: 1
    t.integer "course_hour", limit: 1
    t.integer "course_hour_in_week", limit: 1
    t.integer "lab_hour_in_week", limit: 1
    t.integer "number_week", limit: 1
    t.string "other_activity", limit: 50, default: ".............."
    t.integer "other_activity_hour", limit: 1
    t.integer "knowledge", limit: 1
    t.integer "skill", limit: 1
    t.integer "attitude", limit: 1
    t.integer "uts", limit: 1
    t.integer "uas", limit: 1
    t.integer "tugas", limit: 1
    t.integer "quiz", limit: 1
    t.string "whiteboard", limit: 1
    t.string "lcd", limit: 1
    t.string "courseware", limit: 1
    t.string "lab", limit: 1
    t.string "elearning", limit: 1
    t.boolean "status", default: true, null: false
    t.text "prerequisites"
    t.text "course_description"
    t.text "course_objectives"
    t.text "learning_outcomes"
    t.text "course_format"
    t.text "grading_procedure"
    t.text "course_content"
    t.integer "ref_kbk_id"
    t.integer "course_group_id"
    t.integer "tahun_kurikulum_id"
    t.string "web_page", limit: 150
    t.boolean "ekstrakurikuler", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["course_group_id"], name: "FK_krkm_kurikulum_cg"
    t.index ["kode_mk"], name: "KODE_MK_2"
    t.index ["nama_kul_ind"], name: "NAMA_KUL_IND"
    t.index ["nama_kul_ing"], name: "NAMA_KUL_ING"
    t.index ["ref_kbk_id"], name: "fk_t_kurikulum_t_ref_kbk2_idx"
    t.index ["tahun_kurikulum_id"], name: "FK_krkm_kurikulum"
  end

  create_table "krkm_kuliah_ekivalen", primary_key: "kuliah_ekivalen_id", id: :integer, force: :cascade do |t|
    t.integer "mk_asal", null: false
    t.integer "mk_tujuan", null: false
    t.boolean "is_asal_many", default: false
    t.boolean "is_tujuan_many", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["mk_asal"], name: "mk_asal"
    t.index ["mk_tujuan"], name: "mk_tujuan"
  end

  create_table "krkm_kuliah_prodi", primary_key: "krkm_kuliah_prodi_id", id: :integer, force: :cascade do |t|
    t.integer "kuliah_id"
    t.integer "ref_kbk_id"
    t.integer "semester"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["kuliah_id"], name: "FK_krkm_kuliah_prodi"
    t.index ["ref_kbk_id"], name: "FK_krkm_kuliah_prodi_ref_kbk"
  end

  create_table "krkm_kurikulum_prodi", primary_key: "kurikulum_prodi_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 2012, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "kbk_id", default: "", null: false
    t.integer "kurikulum_id"
    t.integer "ref_kbk_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_id"], name: "fk_t_kurikulum_prodi_t_kurikulum1_idx"
    t.index ["ref_kbk_id"], name: "fk_t_kurikulum_prodi_t_ref_kbk1_idx"
  end

  create_table "krkm_prerequisite_courses", primary_key: "prerequisite_courses_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0
    t.string "kode_mk", limit: 11
    t.integer "kuliah_id"
    t.integer "id_kur_pre", default: 0
    t.string "kode_mk_pre", limit: 10
    t.integer "kuliah_pre_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kuliah_id"], name: "FK_krkm_prerequisite_courses_kuri"
    t.index ["kuliah_pre_id"], name: "FK_krkm_prerequisite_courses_kuri_pre"
  end

  create_table "krkm_r_tahun_kurikulum", primary_key: "tahun_kurikulum_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "krkm_sifat_kuliah", primary_key: "sifat_kuliah_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "labx_alat", primary_key: "alat_id", id: :integer, force: :cascade do |t|
    t.string "kode_alat", limit: 50
    t.integer "lab_id"
    t.integer "lemari_id"
    t.string "name", limit: 50, null: false
    t.string "merk", limit: 50
    t.bigint "stok_alat"
    t.bigint "stok_available"
    t.bigint "stok_min"
    t.bigint "stok_inventori"
    t.integer "tahun"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 50
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 50
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 50
    t.index ["lab_id"], name: "fk_lab"
    t.index ["lemari_id"], name: "fk_lemari"
  end

  create_table "labx_alat_rusak", primary_key: "alat_rusak_id", id: :integer, force: :cascade do |t|
    t.integer "alat_id", null: false
    t.integer "peminjaman_id"
    t.float "jumlah", limit: 53, null: false
    t.integer "status_alat_rusak"
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["alat_id"], name: "fk_alat_id_rusak"
    t.index ["peminjaman_id"], name: "fk_peminjaman_id_rusak"
  end

  create_table "labx_bahan", primary_key: "bahan_id", id: :integer, force: :cascade do |t|
    t.integer "lab_id"
    t.integer "lemari_id"
    t.string "name", limit: 50, null: false
    t.string "rumus_molekul", limit: 50
    t.string "nama_lain", limit: 50
    t.string "berat_molekul", limit: 30
    t.float "stok_bahan", limit: 53
    t.float "stok_min", limit: 53
    t.bigint "stok_inventori"
    t.integer "satuan_id"
    t.string "desc", limit: 250
    t.date "expired_date"
    t.decimal "harga", precision: 19, scale: 4
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["lab_id"], name: "fk_lab_bahan"
    t.index ["lemari_id"], name: "fk_lemari_bahan"
    t.index ["satuan_id"], name: "fk_satuan"
  end

  create_table "labx_item_pemesanan", primary_key: "item_pemesanan_id", id: :integer, force: :cascade do |t|
    t.integer "pemesanan_id"
    t.integer "bahan_id"
    t.float "jumlah", limit: 53
    t.integer "status_id"
    t.string "review", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["bahan_id"], name: "fk_bahan_oesan"
    t.index ["pemesanan_id"], name: "fk_pemesanan_bahan"
    t.index ["status_id"], name: "fk_item_pemesanan_status"
  end

  create_table "labx_item_peminjaman", primary_key: "item_peminjaman_id", id: :integer, force: :cascade do |t|
    t.integer "peminjaman_id"
    t.integer "alat_id"
    t.float "jumlah", limit: 53
    t.integer "status_id"
    t.string "review", limit: 100
    t.datetime "tanggal_pengembalian", precision: nil
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["alat_id"], name: "fk_item_alat"
    t.index ["peminjaman_id"], name: "fk_item_peminjaman"
    t.index ["status_id"], name: "fk_item_peminjaman_status"
  end

  create_table "labx_lab", primary_key: "lab_id", id: :integer, force: :cascade do |t|
    t.string "kode_lab", limit: 15, null: false
    t.string "name", limit: 30, null: false
    t.string "desc", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "labx_lemari", primary_key: "lemari_id", id: :integer, force: :cascade do |t|
    t.string "jenis_lemari", limit: 30, null: false
    t.string "desc", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "labx_pemesanan", primary_key: "pemesanan_id", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.integer "dim_id"
    t.integer "pegawai_id"
    t.integer "tujuan_id", null: false
    t.integer "kuliah_id"
    t.string "desc", limit: 100
    t.datetime "tanggal_pemesanan", precision: nil
    t.integer "status_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.integer "updated_at"
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_dim_pemesanan2"
    t.index ["kuliah_id"], name: "fk_kuliah2"
    t.index ["pegawai_id"], name: "fk_pegawai_pemesanan2"
    t.index ["status_id"], name: "fk_status2"
    t.index ["tujuan_id"], name: "fk_tujuan2"
    t.index ["user_id"], name: "fk_pemesan_bahan2"
  end

  create_table "labx_peminjaman", primary_key: "peminjaman_id", id: :integer, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "dim_id"
    t.integer "pegawai_id"
    t.integer "tujuan_id", null: false
    t.integer "kuliah_id"
    t.datetime "realisasi_peminjaman", precision: nil
    t.datetime "tanggal_pengembalian", precision: nil
    t.datetime "realisasi_pengembalian", precision: nil
    t.decimal "denda", precision: 19, scale: 4
    t.string "desc", limit: 100
    t.integer "status_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_dim_peminjaman"
    t.index ["kuliah_id"], name: "fk_kuliah"
    t.index ["pegawai_id"], name: "fk_pegawai_peminjaman"
    t.index ["status_id"], name: "fk_status_peminjaman"
    t.index ["tujuan_id"], name: "fk_tujuan_peminjaman"
    t.index ["user_id"], name: "fk_peminjam_alat"
  end

  create_table "labx_penambahan_stok_alat", primary_key: "penambahan_stok_alat_id", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.integer "pegawai_id"
    t.integer "alat_id"
    t.integer "jumlah", null: false
    t.datetime "tanggal_penambahan", precision: nil
    t.integer "status_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["alat_id"], name: "alatfk3"
    t.index ["pegawai_id"], name: "fk_pegawai3"
    t.index ["status_id"], name: "statusfk3"
    t.index ["user_id"], name: "userfk3"
  end

  create_table "labx_penambahan_stok_bahan", primary_key: "penambahan_stok_bahan_id", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.integer "pegawai_id"
    t.integer "bahan_id"
    t.float "jumlah", limit: 53, null: false
    t.datetime "tanggal_penambahan", precision: nil
    t.integer "status_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["bahan_id"], name: "bahanfk24"
    t.index ["pegawai_id"], name: "fk_pegawai24"
    t.index ["status_id"], name: "statusfk4"
    t.index ["user_id"], name: "userfkbahan4"
  end

  create_table "labx_r_status", primary_key: "status_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "labx_r_tujuan", primary_key: "tujuan_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "desc", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "labx_satuan", primary_key: "satuan_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "lppm_penelitian", primary_key: "penelitian_id", id: :integer, force: :cascade do |t|
    t.string "judul_penelitian", limit: 500
    t.string "tahun", limit: 10
    t.string "biaya", limit: 50
    t.string "sumber_dana", limit: 100
    t.string "skema", limit: 100
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "lppm_penelitian_dosen", primary_key: "penelitian_dosen_id", id: :integer, force: :cascade do |t|
    t.integer "penelitian_id"
    t.integer "dosen_id"
    t.index ["dosen_id"], name: "dosen_id"
    t.index ["penelitian_id"], name: "lppm_penelitian_dosen_ibfk_3"
  end

  create_table "lppm_r_karyailmiah", primary_key: "karyailmiah_id", id: :integer, force: :cascade do |t|
    t.string "jenis", limit: 20, null: false
    t.string "keterangan", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "lppm_r_subkaryailmiah", primary_key: "subkaryailmiah_id", id: :integer, force: :cascade do |t|
    t.integer "karyailmiah_id", null: false
    t.string "jenis", limit: 50, null: false
    t.string "keterangan", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["karyailmiah_id"], name: "FK_lppm_r_subkaryailmiah"
  end

  create_table "lppm_t_author_publikasi", primary_key: "author_publikasi_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id"
    t.string "nama_author"
    t.string "institusi", limit: 100, default: "255"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["publikasi_id"], name: "FK_lppm_t_author_publikasi"
  end

  create_table "lppm_t_ketua_gbk", primary_key: "ketuagbk_id", id: :integer, force: :cascade do |t|
    t.integer "gbk_id", null: false
    t.integer "dosen_id"
    t.string "keterangan", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["dosen_id"], name: "FK_lppm_t_ketua_gbk_dosen"
    t.index ["gbk_id"], name: "FK_lppm_t_ketua_gbk_gbk"
  end

  create_table "lppm_t_logreview", primary_key: "logreview_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id", null: false
    t.integer "pegawai_id"
    t.text "catatanperbaikanreview"
    t.integer "review", default: 0
    t.integer "status", default: 0
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["pegawai_id"], name: "FK_lppm_t_logreview_pegawai"
    t.index ["publikasi_id"], name: "FK_lppm_t_logreview_publikasi"
  end

  create_table "lppm_t_publikasi", primary_key: "publikasi_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id"
    t.integer "subkaryailmiah_id"
    t.string "konferensi", limit: 50
    t.integer "review", default: 0
    t.integer "gbk_id"
    t.string "judul"
    t.text "abstrak"
    t.date "deadline"
    t.date "tanggal_publish"
    t.string "keterangan", limit: 1000
    t.integer "status", default: 0
    t.integer "reward", default: 0
    t.integer "approved_ketuagbk", default: 0
    t.string "website", limit: 50
    t.string "path_uploaddokumen"
    t.string "kode_file", limit: 50
    t.boolean "is_published", default: false
    t.text "pesan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["gbk_id"], name: "FK_lppm_t_publikasi_gbk"
    t.index ["pegawai_id"], name: "FK_lppm_t_publikasi_pegawai"
    t.index ["subkaryailmiah_id"], name: "FK_lppm_t_publikasi_sub_karya_ilmiah"
  end

  create_table "lppm_t_registrasi_file", primary_key: "registrasifile_id", id: :integer, force: :cascade do |t|
    t.integer "registrasipublikasi_id"
    t.string "nama_file"
    t.string "kode_file"
    t.integer "index_file"
    t.string "keterangan", limit: 50
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["registrasipublikasi_id"], name: "FK_lppm_t_registrasi_file"
  end

  create_table "lppm_t_registrasi_jurnal", primary_key: "registrasi_jurnal_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id"
    t.decimal "biaya_registrasi", precision: 11
    t.integer "status_approved"
    t.text "keterangan_approved"
    t.text "catatan"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["publikasi_id"], name: "FK_lppm_t_registrasi_jurnal"
  end

  create_table "lppm_t_registrasi_jurnal_file", primary_key: "registrasi_jurnal_file_id", id: :integer, force: :cascade do |t|
    t.integer "registrasi_jurnal_id"
    t.string "nama_file", limit: 200
    t.string "kode_file", limit: 200
    t.integer "index_file"
    t.text "keterangan"
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["registrasi_jurnal_id"], name: "FK_lppm_t_registrasi_jurnal_file"
  end

  create_table "lppm_t_registrasi_prosiding", primary_key: "registrasi_prosiding_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id"
    t.date "waktu_mulai"
    t.date "waktu_selesai"
    t.string "rute_transport_udara"
    t.string "rute_transport_laut"
    t.string "rute_transport_darat"
    t.integer "status_approved"
    t.text "keterangan_approved"
    t.text "catatan"
    t.decimal "biaya_pendaftaran", precision: 11
    t.decimal "biaya_transport_darat", precision: 11
    t.decimal "biaya_transport_laut", precision: 11
    t.decimal "biaya_transport_udara", precision: 11
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["publikasi_id"], name: "FK_lppm_t_registrasi_prosiding"
  end

  create_table "lppm_t_registrasi_prosiding_file", primary_key: "registrasi_prosiding_file_id", id: :integer, force: :cascade do |t|
    t.integer "registrasi_prosiding_id"
    t.string "nama_file", limit: 200
    t.string "kode_file", limit: 200
    t.integer "index_file"
    t.text "keterangan"
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["registrasi_prosiding_id"], name: "FK_lppm_t_registrasi_prosiding_file"
  end

  create_table "lppm_t_registrasipublikasi", primary_key: "registrasipublikasi_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id", null: false
    t.decimal "biaya_pendaftaran", precision: 11
    t.decimal "biaya_transport", precision: 11
    t.string "keterangan_transport"
    t.decimal "biaya_transport2", precision: 11
    t.string "keterangan_transport2"
    t.decimal "biaya_penginapan", precision: 11
    t.date "tanggal_berangkat"
    t.date "tanggal_pulang"
    t.integer "status_approved", default: 0
    t.string "keterangan_approved"
    t.string "catatan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["publikasi_id"], name: "FK_lppm_t_registrasipublikasi_publikasi"
  end

  create_table "lppm_t_review_file", primary_key: "reviewfile_id", id: :integer, force: :cascade do |t|
    t.integer "logreview_id"
    t.string "nama_file"
    t.string "kode_file"
    t.integer "index_file"
    t.string "keterangan", limit: 50
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["logreview_id"], name: "FK_lppm_t_review_file_log_review"
  end

  create_table "lppm_t_reward_file", primary_key: "rewardfile_id", id: :integer, force: :cascade do |t|
    t.integer "rewardpublikasi_id"
    t.string "nama_file"
    t.string "kode_file"
    t.integer "index_file"
    t.string "keterangan", limit: 50
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["rewardpublikasi_id"], name: "FK_lppm_t_reward_file"
  end

  create_table "lppm_t_reward_jurnal", primary_key: "reward_jurnal_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id"
    t.string "issn", limit: 50
    t.string "volume", limit: 50
    t.string "nomor", limit: 50
    t.integer "halaman_awal"
    t.integer "halaman_akhir"
    t.integer "status_reward"
    t.text "keterangan_reward"
    t.decimal "jumlah", precision: 11
    t.text "catatan"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["publikasi_id"], name: "FK_lppm_t_reward_jurnal"
  end

  create_table "lppm_t_reward_jurnal_file", primary_key: "reward_jurnal_file_id", id: :integer, force: :cascade do |t|
    t.integer "reward_jurnal_id"
    t.string "nama_file", limit: 200
    t.string "kode_file", limit: 200
    t.integer "index_file"
    t.text "keterangan"
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["reward_jurnal_id"], name: "FK_lppm_t_reward_jurnal_file"
  end

  create_table "lppm_t_reward_prosiding", primary_key: "reward_prosiding_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id"
    t.string "institusi_penyelenggara", limit: 150
    t.string "tempat_pelaksanaan", limit: 200
    t.integer "status_reward"
    t.text "keterangan_reward"
    t.text "catatan"
    t.decimal "jumlah", precision: 11
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["publikasi_id"], name: "FK_lppm_t_reward_prosiding"
  end

  create_table "lppm_t_reward_prosiding_file", primary_key: "reward_prosiding_file_id", id: :integer, force: :cascade do |t|
    t.integer "reward_prosiding_id"
    t.string "nama_file", limit: 200
    t.string "kode_file", limit: 200
    t.integer "index_file"
    t.text "keterangan"
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["reward_prosiding_id"], name: "FK_lppm_t_reward_prosiding_file"
  end

  create_table "lppm_t_rewardpublikasi", primary_key: "rewardpublikasi_id", id: :integer, force: :cascade do |t|
    t.integer "publikasi_id", null: false
    t.integer "status_reward"
    t.string "keterangan_reward"
    t.string "catatan"
    t.decimal "jumlah", precision: 10
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["publikasi_id"], name: "FK_lppm_t_rewardpublikasi"
  end

  create_table "migration", primary_key: "version", id: { type: :string, limit: 180 }, force: :cascade do |t|
    t.integer "apply_time"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "mref_r_agama", primary_key: "agama_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.integer "feeder_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_asal_sekolah", primary_key: "asal_sekolah_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "alamat"
    t.integer "provinsi_id"
    t.integer "kabupaten_id"
    t.string "kodepos", limit: 8
    t.string "telepon", limit: 20
    t.string "email", limit: 20
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.index ["kabupaten_id"], name: "FK_mref_r_asal_sekolah"
    t.index ["provinsi_id"], name: "FK_mref_r_asal_sekolah_provinsi"
  end

  create_table "mref_r_bidang_pekerjaan", primary_key: "bidang_pekerjaan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "mref_r_bidang_perusahaan", primary_key: "bidang_perusahaan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_gbk", primary_key: "gbk_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_gelombang_pmb", primary_key: "gelombang_pmb_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 50
    t.string "deskripsi", limit: 150
    t.string "lokasi", limit: 25
    t.datetime "tanggal_awal", precision: nil
    t.datetime "tanggal_akhir", precision: nil
    t.integer "feeder_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 25
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 25
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 25
  end

  create_table "mref_r_golongan_darah", primary_key: "golongan_darah_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_golongan_kepangkatan", primary_key: "golongan_kepangkatan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_jabatan_akademik", primary_key: "jabatan_akademik_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_jenis_kelamin", primary_key: "jenis_kelamin_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_jenjang", primary_key: "jenjang_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "mref_r_jenjang_pendidikan", primary_key: "jenjang_pendidikan_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 32
    t.text "desc"
    t.integer "feeder_id"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_kabupaten", primary_key: "kabupaten_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.integer "provinsi_id"
    t.string "feeder_id", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_kecamatan", primary_key: "kecamatan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 32
    t.text "desc"
    t.integer "kabupaten_id"
    t.string "feeder_id", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_lokasi", primary_key: "lokasi_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "mref_r_pekerjaan", primary_key: "pekerjaan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.integer "feeder_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_pendidikan", primary_key: "pendidikan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_pengali_nilai", primary_key: "pengali_nilai_id", id: :integer, force: :cascade do |t|
    t.string "nilai", limit: 3
    t.float "pengali"
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "mref_r_penghasilan", primary_key: "penghasilan_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.integer "feeder_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_predikat_lulus", primary_key: "predikat_lulus_id", id: :integer, force: :cascade do |t|
    t.float "ipk_minimum", limit: 53
    t.string "nama", limit: 50
    t.string "nama_ing", limit: 100
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "mref_r_provinsi", primary_key: "provinsi_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 128
    t.text "desc"
    t.string "feeder_id", limit: 32
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
  end

  create_table "mref_r_role_pengajar", primary_key: "role_pengajar_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "mref_r_sem_ta", primary_key: "sem_ta_id", id: :integer, force: :cascade do |t|
    t.integer "sem_ta"
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "mref_r_sifat_kurikulum", primary_key: "sifat_kurikulum_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_status_aktif_mahasiswa", primary_key: "status_aktif_mahasiswa_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_status_aktif_pegawai", primary_key: "status_aktif_pegawai_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_status_ikatan_kerja_dosen", primary_key: "status_ikatan_kerja_dosen_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_status_ikatan_kerja_pegawai", primary_key: "status_ikatan_kerja_pegawai_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "mref_r_status_marital", primary_key: "status_marital_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
  end

  create_table "mref_r_ta", primary_key: "ta_id", id: :integer, force: :cascade do |t|
    t.integer "nama", null: false
    t.string "desc", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "nlai_ext_mhs", primary_key: "ext_mhs_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id"
    t.date "tgl_test"
    t.string "ta", limit: 5
    t.integer "sem_ta", default: 1
    t.integer "ext_id"
    t.string "score", limit: 32
    t.text "keterangan"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["dim_id"], name: "FK_nlai_ext_mhs_dim"
    t.index ["ext_id"], name: "FK_nlai_ext_mhs"
  end

  create_table "nlai_file_nilai", primary_key: "file_nilai_id", id: :integer, force: :cascade do |t|
    t.text "nama_file"
    t.string "kode_file", limit: 100
    t.text "ket"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "nlai_kompetensi_mbkm", primary_key: "kompetensi_mbkm_id", id: :integer, force: :cascade do |t|
    t.integer "krs_detail_id"
    t.string "kompetensi_short", limit: 250
    t.text "kompetensi_long"
    t.text "nama_silabus"
    t.string "nilai", limit: 6
    t.string "kode_silabus", limit: 250
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["krs_detail_id"], name: "krs_kompetensi"
  end

  create_table "nlai_komponen_tambahan", primary_key: "komponen_tambahan_id", id: :integer, force: :cascade do |t|
    t.string "id_kur", limit: 4
    t.string "kode_mk", limit: 11
    t.string "ta", limit: 4
    t.integer "sem_ta"
    t.float "nilai_tambahan_1"
    t.float "nilai_tambahan_2"
    t.float "nilai_tambahan_3"
    t.float "nilai_tambahan_4"
    t.float "nilai_tambahan_5"
    t.string "nm_tambahan_1", limit: 45, default: "Nilai Tambahan 1"
    t.string "nm_tambahan_2", limit: 45, default: "Nilai Tambahan 2"
    t.string "nm_tambahan_3", limit: 45, default: "Nilai Tambahan 3"
    t.string "nm_tambahan_4", limit: 45, default: "Nilai Tambahan 4"
    t.string "nm_tambahan_5", limit: 45, default: "Nilai Tambahan 5"
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["kurikulum_syllabus_id"], name: "FK_nlai_komponen_tambahan_syllabus"
  end

  create_table "nlai_komposisi_nilai", primary_key: "komposisi_nilai_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0
    t.string "kode_mk", limit: 11
    t.string "ta", limit: 30, default: "0"
    t.integer "sem_ta"
    t.float "nilai_praktikum"
    t.float "nilai_quis"
    t.float "nilai_uts"
    t.float "nilai_uas"
    t.float "nilai_tugas"
    t.string "nm_praktikum", limit: 20, default: "Nilai Praktikum", null: false
    t.string "nm_quis", limit: 20, default: "Nilai Quis", null: false
    t.string "nm_uts", limit: 20, default: "Nilai UTS", null: false
    t.string "nm_uas", limit: 20, default: "Nilai UAS", null: false
    t.string "nm_tugas", limit: 20, default: "Nilai Tugas", null: false
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_syllabus_id"], name: "fk_t_komposisi_nilai_t_kurikulum1_idx"
  end

  create_table "nlai_komposisi_nilai_uts_uas", primary_key: "komposisi_nilai_uts_uas_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur"
    t.string "kode_mk", limit: 11
    t.string "ta", limit: 4
    t.integer "sem_ta"
    t.integer "kurikulum_syllabus_id"
    t.float "nilai_uts_teori"
    t.float "nilai_uts_praktikum"
    t.float "nilai_uas_teori"
    t.float "nilai_uas_praktikum"
    t.string "nm_uts_teori", limit: 50, default: "UTS_TEORI"
    t.string "nm_uts_praktikum", limit: 50, default: "UTS_PRAKTIKUM"
    t.string "nm_uas_teori", limit: 50, default: "UAS_TEORI"
    t.string "nm_uas_praktikum", limit: 50, default: "UAS_PRAKTIKUM"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["kurikulum_syllabus_id"], name: "FK_nlai_komposisi_nilai_uts_uas"
  end

  create_table "nlai_nilai", primary_key: "nilai_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta"
    t.string "nim", limit: 8, default: "", null: false
    t.integer "komponen_ke", default: 0
    t.float "na", default: 0.0
    t.string "nilai", limit: 3
    t.float "na_remedial"
    t.string "nilai_remedial", limit: 3
    t.string "kelas", limit: 5
    t.integer "sks", null: false, comment: "Jumlah SKS"
    t.integer "sem", comment: "Semseter Kurikulum"
    t.string "wali_approval", limit: 100
    t.string "dir_approval", limit: 100
    t.string "dosen_approval", limit: 100
    t.text "keterangan"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.boolean "ispublish", default: false
    t.boolean "isekivalen", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_t_dim1_idx"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_nilai_t_kurikulum1_idx"
    t.index ["nim"], name: "NIM"
  end

  create_table "nlai_nilai_komponen_tambahan", primary_key: "nilai_komponen_tambahan_id", id: :integer, force: :cascade do |t|
    t.integer "kurikulum_syllabus_id"
    t.string "id_kur", limit: 4
    t.string "kode_mk", limit: 50
    t.integer "ta"
    t.integer "sem_ta"
    t.integer "komponen_ke"
    t.string "komponen", limit: 45
    t.string "nim", limit: 10
    t.integer "dim_id"
    t.float "nilai"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["dim_id"], name: "FK_nlai_nilai_komponen_tambahan-dim"
    t.index ["kurikulum_syllabus_id"], name: "FK_nlai_nilai_komponen_tambahan_syllabus"
  end

  create_table "nlai_nilai_praktikum", primary_key: "nilai_praktikum_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 4, default: "0", null: false
    t.integer "sem_ta"
    t.string "nim", limit: 8, default: "", null: false
    t.string "komponen", limit: 30
    t.string "dosen_approval", limit: 100
    t.integer "komponen_ke", limit: 2
    t.float "nilai", null: false
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_praktikum_t_dim1_idx"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_nilai_praktikum_t_kurikulum1_idx"
  end

  create_table "nlai_nilai_quis", primary_key: "nilai_quis_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta"
    t.string "nim", limit: 8, default: "", null: false
    t.string "komponen", limit: 30
    t.string "dosen_approval", limit: 100
    t.integer "komponen_ke", limit: 2
    t.float "nilai"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_quis_t_dim1_idx"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_nilai_quis_t_kurikulum1_idx"
  end

  create_table "nlai_nilai_tugas", primary_key: "nilai_tugas_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta"
    t.string "nim", limit: 8, default: "", null: false
    t.string "komponen", limit: 30
    t.string "dosen_approval", limit: 100
    t.integer "komponen_ke", limit: 2
    t.float "nilai"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_tugas_t_dim1_idx"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_nilai_tugas_t_kurikulum1_idx"
  end

  create_table "nlai_nilai_uas", primary_key: "nilai_uas_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta"
    t.string "nim", limit: 8, default: "", null: false
    t.string "komponen", limit: 30
    t.string "dosen_approval", limit: 100
    t.integer "komponen_ke", limit: 2
    t.float "nilai"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.boolean "ispublish", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_nilai_uas_t_dim1_idx"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_nilai_uas_t_kurikulum1_idx"
  end

  create_table "nlai_nilai_uts", primary_key: "nilai_uts_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta"
    t.string "nim", limit: 8, default: "", null: false
    t.string "komponen", limit: 30
    t.string "dosen_approval", limit: 100
    t.integer "komponen_ke", limit: 2
    t.float "nilai"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.boolean "ispublish", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_at", limit: 45
    t.string "updated_at", limit: 45
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.index ["dim_id"], name: "fk_t_nilai_uts_t_dim1_idx"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_nilai_uts_t_kurikulum1_idx"
  end

  create_table "nlai_r_ext", primary_key: "ext_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 45, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "nlai_rentang_nilai", primary_key: "rentang_nilai_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "ta", limit: 30, default: "0", null: false
    t.integer "sem_ta"
    t.float "a"
    t.string "ab", limit: 8
    t.float "b"
    t.string "bc", limit: 8
    t.float "c"
    t.float "d"
    t.float "e"
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_syllabus_id"], name: "fk_t_rentang_nilai_t_kurikulum1_idx"
  end

  create_table "nlai_uas_detail", primary_key: "uas_detail_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur"
    t.string "kode_mk", limit: 11
    t.string "ta", limit: 30
    t.integer "sem_ta"
    t.string "nim", limit: 8
    t.string "komponen", limit: 30
    t.integer "komponen_ke"
    t.float "nilai"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.integer "komposisi_nilai_uts_uas_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["dim_id"], name: "FK_nlai_uas_detail_dim"
    t.index ["komposisi_nilai_uts_uas_id"], name: "FK_nlai_uas_detail_komposisi"
    t.index ["kurikulum_syllabus_id"], name: "FK_nlai_uas_detail"
  end

  create_table "nlai_unapprove_nilai", primary_key: "unapprove_nilai_id", id: :integer, force: :cascade do |t|
    t.integer "kuliah_id"
    t.integer "ta"
    t.integer "sem_ta"
    t.integer "pemohon_id"
    t.text "alasan"
    t.boolean "status", default: true, comment: "1: Menunggu; 2: Diterima; 3: Ditolak"
    t.integer "confirmed_by"
    t.date "confirmed_date"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["confirmed_by"], name: "confirmed_by"
    t.index ["kuliah_id"], name: "kuliah_id"
    t.index ["pemohon_id"], name: "pemohon_id"
  end

  create_table "nlai_uts_detail", primary_key: "uts_detail_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur"
    t.string "kode_mk", limit: 11
    t.string "ta", limit: 30
    t.integer "sem_ta"
    t.string "nim", limit: 8
    t.string "komponen", limit: 30
    t.integer "komponen_ke"
    t.float "nilai"
    t.integer "dim_id"
    t.integer "kurikulum_syllabus_id"
    t.integer "komposisi_nilai_uts_uas_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["dim_id"], name: "FK_nlai_uts_detail_dim"
    t.index ["komposisi_nilai_uts_uas_id"], name: "FK_nlai_uts_detail_komposisi"
    t.index ["kurikulum_syllabus_id"], name: "FK_nlai_uts_detail"
  end

  create_table "prkl_berita_acara_daftar_hadir", primary_key: "berita_acara_daftar_hadir_id", id: :integer, force: :cascade do |t|
    t.integer "week", limit: 2, default: 0, null: false
    t.integer "session", limit: 2, default: 0, null: false
    t.integer "ta", default: 2002, null: false
    t.integer "id_kur", default: 2002, null: false
    t.integer "kurikulum_id"
    t.string "kode_mk", limit: 11, null: false
    t.string "nim", limit: 8, default: "", null: false
    t.integer "dim_id"
    t.string "status", limit: 7, default: "H"
    t.text "keterangan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_t_berita_acara_daftar_hadir_t_dim1_idx"
    t.index ["kurikulum_id"], name: "fk_t_berita_acara_daftar_hadir_t_kurikulum1_idx"
  end

  create_table "prkl_berita_acara_kuliah", primary_key: "berita_acara_kuliah_id", id: :integer, force: :cascade do |t|
    t.integer "week", limit: 2, default: 0, null: false
    t.integer "session", limit: 2, default: 0, null: false
    t.integer "ta", default: 2002, null: false
    t.integer "id_kur", default: 2002, null: false
    t.string "kode_mk", limit: 11, null: false
    t.integer "kurikulum_id"
    t.string "kelas", limit: 100, null: false
    t.integer "kelas_id"
    t.date "tanggal", null: false
    t.time "start_time"
    t.time "end_time"
    t.text "topik"
    t.string "ruangan", limit: 100
    t.string "aktifitas", limit: 15
    t.string "pic", limit: 20
    t.text "metode"
    t.text "alat_bantu"
    t.text "catatan"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kelas_id"], name: "fk_t_berita_acara_kuliah_t_kelas1_idx"
    t.index ["kurikulum_id"], name: "fk_t_berita_acara_kuliah_t_kurikulum1_idx"
  end

  create_table "prkl_course_unit", primary_key: "course_unit_id", id: :integer, force: :cascade do |t|
    t.integer "week", limit: 2, default: 0, null: false
    t.integer "session", limit: 2, default: 0, null: false
    t.string "status", limit: 1, default: "", null: false
    t.integer "ta", default: 2002
    t.integer "id_kur", default: 2002
    t.string "kode_mk", limit: 11
    t.string "topik"
    t.text "sub_topik"
    t.text "objektif"
    t.string "aktifitas", limit: 15
    t.string "pic", limit: 20
    t.integer "pegawai_id"
    t.text "metode"
    t.text "alat_bantu"
    t.string "ket"
    t.datetime "tanggal", precision: nil
    t.string "day", limit: 10
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_syllabus_id"], name: "fk_t_course_unit_t_kurikulum1_idx"
    t.index ["pegawai_id"], name: "FK_prkl_course_unit_pic"
    t.index ["session"], name: "SESSION"
    t.index ["topik"], name: "TOPIK"
    t.index ["week"], name: "WEEK"
  end

  create_table "prkl_course_unit_material", primary_key: "course_unit_material_id", id: :integer, force: :cascade do |t|
    t.integer "week", limit: 2, default: 0, null: false
    t.integer "session", limit: 2, default: 0, null: false
    t.string "status", limit: 1, default: "", null: false
    t.integer "ta", default: 2002, null: false
    t.integer "id_kur", default: 2002, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "id_material", default: "", null: false
    t.integer "kurikulum_id"
    t.integer "material_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_id"], name: "fk_t_course_unit_material_t_kurikulum1_idx"
    t.index ["material_id"], name: "fk_t_course_unit_material_t_material1_idx"
  end

  create_table "prkl_file", primary_key: "file_id", id: :integer, force: :cascade do |t|
    t.string "no", limit: 10, default: "0", null: false
    t.integer "ta", default: 2002, null: false
    t.integer "id_kur", default: 2002, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "nama_file", default: "", null: false
    t.string "owner", limit: 30, default: "", null: false
    t.string "ket"
    t.integer "kurikulum_syllabus_id"
    t.integer "no_group_file"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_syllabus_id"], name: "fk_t_file_t_kurikulum1_idx"
  end

  create_table "prkl_file_materi", primary_key: "file_materi_id", id: :integer, force: :cascade do |t|
    t.text "nama_file", null: false
    t.string "kode_file", limit: 50
    t.text "ket", null: false
    t.integer "materi_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["materi_id"], name: "FK_prkl_file_materi"
  end

  create_table "prkl_file_praktikum", primary_key: "file_praktikum_id", id: :integer, force: :cascade do |t|
    t.text "nama_file", null: false
    t.string "kode_file", limit: 50
    t.text "ket", null: false
    t.integer "praktikum_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["praktikum_id"], name: "FK_prkl_file_praktikum"
  end

  create_table "prkl_file_syllabus", primary_key: "file_syllabus_id", id: :integer, force: :cascade do |t|
    t.integer "kurikulum_syllabus_id"
    t.string "nama_file", limit: 200
    t.text "ket"
    t.string "kode_file", limit: 200
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["kurikulum_syllabus_id"], name: "FK_prkl_file_syllabus"
  end

  create_table "prkl_group_kuliah", primary_key: "group_kuliah_id", id: :integer, force: :cascade do |t|
    t.integer "kurikulum_syllabus_id"
    t.string "nama", limit: 50
    t.text "desc"
    t.boolean "deleted"
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["kurikulum_syllabus_id"], name: "FK_prkl_group_kuliah_syllabus"
  end

  create_table "prkl_info_ta", primary_key: "info_ta_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id", null: false
    t.text "judul_ta", null: false
    t.text "judul_ta_ing"
    t.integer "pembimbing_1", null: false
    t.integer "pembimbing_2"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["dim_id"], name: "FK_prkl_info_ta_dim"
    t.index ["pembimbing_1"], name: "FK_prkl_info_ta_pembimbing1"
    t.index ["pembimbing_2"], name: "FK_prkl_info_ta_pembimbing2"
  end

  create_table "prkl_jadwal", primary_key: "jadwal_id", id: :integer, force: :cascade do |t|
    t.integer "week", limit: 2, default: 0, null: false
    t.date "tanggal", null: false
    t.integer "session", limit: 2, default: 0, null: false
    t.integer "ta", default: 2002, null: false
    t.integer "id_kur", default: 2002, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "kelas", limit: 20, default: "", null: false
    t.string "ruangan", limit: 20
    t.string "topik"
    t.text "sub_topik"
    t.text "objektif"
    t.string "aktifitas", limit: 15
    t.string "pic", limit: 20, default: "", null: false
    t.text "metode"
    t.text "alat_bantu"
    t.string "ket"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "createad_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "prkl_krs_detail", primary_key: "krs_detail_id", id: :integer, force: :cascade do |t|
    t.integer "krs_mhs_id"
    t.integer "kuliah_id"
    t.integer "pengajaran_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["krs_mhs_id"], name: "FK_prkl_krs_detail"
    t.index ["kuliah_id"], name: "FK_prkl_krs_detail_kuliah"
    t.index ["pengajaran_id"], name: "FK_prkl_krs_detail_pengajaran"
  end

  create_table "prkl_krs_khusus", primary_key: "krs_khusus_id", id: :integer, force: :cascade do |t|
    t.integer "ta"
    t.integer "sem_ta"
    t.integer "dim_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_prkl_krs_khusus_dimx_dim"
  end

  create_table "prkl_krs_mhs", primary_key: "krs_mhs_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id", null: false
    t.string "nim", limit: 8, null: false
    t.string "sem_ta", limit: 2, null: false
    t.string "ta", limit: 5, null: false
    t.integer "tahun_kurikulum_id", null: false
    t.boolean "status_approval", default: false
    t.string "status_periode", limit: 4
    t.integer "approved_by", comment: "dosen_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["approved_by"], name: "FK_prkl_krs_mhs_wali"
    t.index ["dim_id"], name: "FK_prkl_krs_mhs-dim"
    t.index ["ta"], name: "FK_prkl_krs_mhs_ta"
    t.index ["tahun_kurikulum_id"], name: "FK_prkl_krs_mhs_ta_kur"
  end

  create_table "prkl_krs_review", primary_key: "review_id", id: :integer, force: :cascade do |t|
    t.integer "comment_by"
    t.integer "krs_mhs_id"
    t.text "comment"
    t.date "tgl_comment"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["comment_by"], name: "FK_prkl_krs_review_dosen"
    t.index ["krs_mhs_id"], name: "FK_prkl_krs_review"
  end

  create_table "prkl_kuesioner_materi", primary_key: "kuesioner_materi_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner", null: false
    t.integer "id_kur"
    t.integer "ta"
    t.integer "sem"
    t.string "kode_mk", limit: 11
    t.string "judul"
    t.string "status", limit: 50, default: "NOT ACTIVE"
    t.string "pengajar", limit: 20
    t.datetime "time_activated", precision: nil
    t.integer "kurikulum_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_id", precision: nil
    t.datetime "updated_id", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_id"], name: "FK_t_kuesioner_materi"
  end

  create_table "prkl_kuesioner_praktikum", primary_key: "kuesioner_praktikum_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner", null: false
    t.integer "id_kur"
    t.integer "ta"
    t.integer "sem"
    t.string "kode_mk", limit: 11
    t.integer "kuliah_id"
    t.string "judul"
    t.string "status", limit: 20, default: "NOT ACTIVE"
    t.string "pengajar", limit: 50
    t.datetime "time_activated", precision: nil
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kuliah_id"], name: "FK_t_kuesioner_praktikum"
  end

  create_table "prkl_kurikulum_syllabus", primary_key: "kurikulum_syllabus_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 2001
    t.string "kode_mk", limit: 11
    t.integer "ta", default: 2005
    t.integer "sem_ta", null: false
    t.integer "map_to_kurikulum_syllabus_id"
    t.text "prerequisites"
    t.text "corerequisites"
    t.text "course_description"
    t.text "course_objectives"
    t.text "learning_outcomes"
    t.text "course_format"
    t.text "grading_procedure"
    t.text "course_content"
    t.text "reference"
    t.text "tools"
    t.integer "kuliah_id"
    t.integer "ta_id", null: false
    t.string "meetings", limit: 100
    t.string "tipe", limit: 25
    t.string "level", limit: 15
    t.string "web_page", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["id_kur"], name: "ID_KUR"
    t.index ["kode_mk"], name: "KODE_MK_2"
    t.index ["kode_mk"], name: "KODE_MK_3"
    t.index ["kuliah_id"], name: "fk_t_kurikulum_syllabus_t_kurikulum1_idx"
    t.index ["ta"], name: "TA"
    t.index ["ta_id"], name: "FK_prkl_kurikulum_syllabus_ta"
  end

  create_table "prkl_kurikulum_syllabus_file", primary_key: "kurikulum_syllabus_file_id", id: :integer, force: :cascade do |t|
    t.integer "kurikulum_syllabus_id"
    t.string "nama_file"
    t.string "kode_file"
    t.text "keterangan"
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.boolean "clone", default: false
    t.index ["kurikulum_syllabus_id"], name: "FK_prkl_kurikulum_syllabus_file"
  end

  create_table "prkl_materi", primary_key: "materi_id", id: :integer, force: :cascade do |t|
    t.integer "no", limit: 2, default: 0, null: false
    t.integer "ta", default: 2002, null: false
    t.integer "id_kur", default: 2002, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "minggu_ke", limit: 2
    t.integer "sesi", limit: 2
    t.string "judul"
    t.string "inisial", limit: 15
    t.text "isi", size: :long
    t.datetime "tgl_sesi", precision: nil
    t.datetime "tgl_view", precision: nil
    t.string "status", limit: 1
    t.integer "counter", default: 0
    t.integer "kurikulum_syllabus_id"
    t.integer "group_kuliah_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["group_kuliah_id"], name: "FK_prkl_materi_group_kuliah"
    t.index ["kurikulum_syllabus_id"], name: "FK_prkl_materi_syllabus"
  end

  create_table "prkl_material", primary_key: "material_id", id: :integer, force: :cascade do |t|
    t.string "id_material", limit: 30, default: "", null: false
    t.string "kategori", default: "", null: false
    t.integer "ta", default: 0, null: false
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.string "judul"
    t.string "aktifitas"
    t.string "ket_setoran"
    t.datetime "batas_akhir", precision: nil
    t.column "metoda_penyerahan", "enum('Hardcopy','Email','Web')", default: "Hardcopy"
    t.string "tujuan"
    t.datetime "tanggal", precision: nil
    t.bigint "tgl_view"
    t.string "status", limit: 1, default: "1", null: false
    t.string "komentar", limit: 1, default: "0"
    t.text "isi", size: :long
    t.integer "material_kategori_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["material_id"], name: "ID_MATERIAL"
    t.index ["material_kategori_id"], name: "fk_t_material_t_material_kategori1_idx"
  end

  create_table "prkl_material_files", primary_key: "material_files_id", id: :integer, force: :cascade do |t|
    t.string "id_material", limit: 30, default: "0", null: false
    t.string "nama_file"
    t.string "kode_file", limit: 100, comment: "id file dari puro"
    t.binary "data", size: :long
    t.string "ket"
    t.string "tipe", limit: 50
    t.integer "size"
    t.column "lokasi", "enum('DB','FILE')", default: "DB", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["id_material"], name: "ID_MATERIAL"
    t.index ["nama_file"], name: "NAMA_FILE"
  end

  create_table "prkl_material_kategori", primary_key: "material_kategori_id", id: :integer, force: :cascade do |t|
    t.string "kategori", default: "", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kategori"], name: "KATEGORI_UNIQUE", unique: true
  end

  create_table "prkl_modul_report", primary_key: "modul_report_id", id: :integer, force: :cascade do |t|
    t.integer "kuliah_id", null: false
    t.integer "kurikulum_syllabus_id"
    t.integer "sem_ta"
    t.integer "ta"
    t.integer "week"
    t.boolean "hari_id"
    t.boolean "type"
    t.boolean "teori_materi"
    t.boolean "teori_video"
    t.boolean "teori_file"
    t.boolean "praktikum_materi"
    t.boolean "praktikum_video"
    t.boolean "praktikum_file"
    t.date "time_check"
    t.column "status", "enum('Tepat Waktu','Terlambat','Tidak Upload')"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "date_file", precision: nil
    t.datetime "date_video", precision: nil
    t.text "sanggahan"
    t.index ["kuliah_id"], name: "fk_kuliah_id"
    t.index ["kurikulum_syllabus_id"], name: "fk_kurikulum_syllabus_id"
  end

  create_table "prkl_penilaian_materi", primary_key: "penilaian_materi_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner"
    t.integer "id_kur"
    t.integer "ta"
    t.string "kode_mk", limit: 20
    t.string "peserta", limit: 20
    t.integer "s1"
    t.integer "s2"
    t.integer "s3"
    t.integer "s4"
    t.integer "s5"
    t.integer "s6"
    t.integer "skor_total"
    t.integer "kuesioner_materi_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kuesioner_materi_id"], name: "fk_t_penilaian_materi_t_kuesioner_materi1_idx"
  end

  create_table "prkl_penilaian_materi_nilai", primary_key: "penilaian_materi_nilai_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner"
    t.string "peserta", limit: 20
    t.string "kesulitan_materi", limit: 10
    t.string "pemahaman_mahasiswa", limit: 10
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "prkl_penilaian_praktikum", primary_key: "penilaian_praktikum_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner"
    t.integer "id_kur"
    t.integer "ta"
    t.string "kode_mk", limit: 20
    t.string "peserta", limit: 20
    t.integer "s1"
    t.integer "s2"
    t.integer "s3"
    t.integer "s4"
    t.integer "s5"
    t.integer "s6"
    t.integer "skor_total"
    t.integer "kuesioner_praktikum_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kuesioner_praktikum_id"], name: "fk_t_penilaian_praktikum_t_kuesioner_praktikum1_idx"
  end

  create_table "prkl_penilaian_praktikum_nilai", primary_key: "penilaian_praktikum_nilai_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner"
    t.string "peserta", limit: 20
    t.string "penyelesaian", limit: 20
    t.string "kesulitan_praktikum", limit: 20
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "prkl_penilaian_tim_pengajar", primary_key: "penilaian_tim_pengajar_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner"
    t.string "user_id", limit: 20
    t.string "user_name", limit: 20
    t.integer "ta"
    t.string "kode_mk", limit: 20
    t.string "status", limit: 20
    t.integer "k1"
    t.integer "k2"
    t.integer "k3"
    t.integer "k4"
    t.integer "k5"
    t.integer "k6"
    t.integer "skor_total", default: 0
    t.integer "profile_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["profile_id"], name: "FK_prkl_penilaian_tim_pengajar_profile"
  end

  create_table "prkl_penilaian_tim_pengajar_nilai", primary_key: "penilaian_tim_pengajar_nilai_id", id: :integer, force: :cascade do |t|
    t.integer "id_kuesioner"
    t.string "user", limit: 20
    t.string "dosen_id", limit: 20
    t.integer "ta"
    t.string "status", limit: 11
    t.string "nilai", limit: 5
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "prkl_portofolio", primary_key: "portofolio_id", id: :integer, force: :cascade do |t|
    t.integer "week", limit: 1
    t.string "kode_cpmk", limit: 20
    t.text "rumusan_cpmk"
    t.string "kode_mk", limit: 11
    t.integer "kuliah_id"
    t.string "sem_ta", limit: 2
    t.string "ta", limit: 5
    t.integer "pegawai_id"
    t.string "bentuk_materi_pre", limit: 125
    t.string "bentuk_materi_in", limit: 125
    t.string "bentuk_materi_after", limit: 125
    t.string "media_pelaksanaan_pre", limit: 125
    t.string "media_pelaksanaan_in", limit: 125
    t.string "media_pelaksanaan_after", limit: 125
    t.string "metode_pelaksanaan_pre", limit: 125
    t.string "metode_pelaksanaan_in", limit: 125
    t.string "metode_pelaksanaan_after", limit: 125
    t.string "metode_evaluasi_pre", limit: 125
    t.string "metode_evaluasi_in", limit: 125
    t.string "metode_evaluasi_after", limit: 125
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "prkl_portofolio_review", primary_key: "portofolio_review_id", id: :integer, force: :cascade do |t|
    t.text "pengamatan_kelas"
    t.text "komentar_umum"
    t.text "kendala_perkuliahan"
    t.text "kesimpulan"
    t.text "rekomendasi_perbaikan"
    t.integer "kuliah_id"
    t.string "kode_mk", limit: 11
    t.string "sem_ta", limit: 2
    t.string "ta", limit: 5
    t.integer "pegawai_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "prkl_portofolio_ujian", primary_key: "portofolio_ujian_id", id: :integer, force: :cascade do |t|
    t.column "jenis_ujian", "enum('UTS','UAS')"
    t.string "bentuk_ujian", limit: 200
    t.text "materi_ujian"
    t.string "sifat_ujian", limit: 200
    t.integer "pegawai_id"
    t.integer "kuliah_id"
    t.string "kode_mk", limit: 11
    t.integer "sem_ta", limit: 2
    t.integer "ta", limit: 2
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "prkl_praktikum", primary_key: "praktikum_id", id: :integer, force: :cascade do |t|
    t.integer "no", limit: 2, default: 0, null: false
    t.integer "ta", default: 0, null: false
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 11, null: false
    t.integer "minggu_ke", limit: 2
    t.integer "sesi", limit: 2
    t.string "topik"
    t.string "aktifitas"
    t.string "waktu_pengerjaan", limit: 50
    t.string "setoran"
    t.string "batas_akhir", limit: 50
    t.string "tempat_penyerahan"
    t.string "tujuan"
    t.datetime "tanggal", precision: nil
    t.datetime "tgl_view", precision: nil
    t.string "status", limit: 1
    t.integer "counter", default: 1
    t.text "isi", size: :long
    t.integer "kurikulum_syllabus_id"
    t.integer "group_kuliah_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["group_kuliah_id"], name: "FK_prkl_praktikum_group_kuliah"
    t.index ["kurikulum_syllabus_id"], name: "fk_t_praktikum_t_kurikulum1_idx"
    t.index ["no"], name: "NO"
    t.index ["topik"], name: "TOPIK"
  end

  create_table "prkl_rpp", primary_key: "rpp_id", id: :integer, force: :cascade do |t|
    t.integer "minggu"
    t.integer "sesi"
    t.text "topik"
    t.integer "kurikulum_syllabus_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["kurikulum_syllabus_id"], name: "FK_prkl_rpp_kurikulum_syllabus"
  end

  create_table "prkl_ruangan", primary_key: "ruangan_id", id: :integer, force: :cascade do |t|
    t.string "kode_ruangan", limit: 20, default: "", null: false
    t.string "short_name", limit: 20, default: "", null: false
    t.string "name", limit: 200
    t.integer "kapasitas"
    t.text "ket"
    t.string "status", limit: 1, default: "1", null: false
    t.datetime "update_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "created_by", limit: 32
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["kode_ruangan"], name: "KODE_RUANGAN_UNIQUE", unique: true
  end

  create_table "rakx_detil_program", primary_key: "detil_program_id", id: :integer, force: :cascade do |t|
    t.integer "program_id", null: false
    t.text "name", null: false
    t.text "desc"
    t.decimal "jumlah", precision: 19, scale: 4, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["program_id"], name: "fk_detil_program_program_idx"
  end

  create_table "rakx_mata_anggaran", primary_key: "mata_anggaran_id", id: :integer, force: :cascade do |t|
    t.integer "standar_id"
    t.string "kode_anggaran", limit: 45, null: false
    t.string "name", limit: 100, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["kode_anggaran"], name: "KODE_ANGGARAN"
    t.index ["name"], name: "NAME"
    t.index ["standar_id"], name: "fk_mata_anggaran_standar_idx"
  end

  create_table "rakx_program", primary_key: "program_id", id: :integer, force: :cascade do |t|
    t.integer "struktur_jabatan_has_mata_anggaran_id", null: false
    t.string "kode_program", limit: 45, null: false
    t.text "name", null: false
    t.text "tujuan"
    t.text "sasaran"
    t.text "target"
    t.text "desc"
    t.integer "rencana_strategis_id"
    t.float "volume", null: false
    t.integer "satuan_id", null: false
    t.decimal "harga_satuan", precision: 19, scale: 4, null: false
    t.decimal "jumlah_sebelum_revisi", precision: 19, scale: 4, null: false
    t.decimal "jumlah", precision: 19, scale: 4
    t.integer "status_program_id"
    t.integer "diusulkan_oleh", null: false
    t.datetime "tanggal_diusulkan", precision: nil
    t.integer "dilaksanakan_oleh"
    t.integer "disetujui_oleh"
    t.datetime "tanggal_disetujui", precision: nil
    t.integer "ditolak_oleh"
    t.datetime "tanggal_ditolak", precision: nil
    t.boolean "is_revisi", default: false
    t.integer "direvisi_oleh"
    t.datetime "tanggal_direvisi", precision: nil
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dilaksanakan_oleh"], name: "fk_program_pelaksana_idx"
    t.index ["direvisi_oleh"], name: "fk_program_perevisi_idx"
    t.index ["disetujui_oleh"], name: "fk_program_disetujui_idx"
    t.index ["ditolak_oleh"], name: "fk_program_ditolak_idx"
    t.index ["diusulkan_oleh"], name: "fk_program_pengusul_idx"
    t.index ["kode_program"], name: "KODE_PROGRAM"
    t.index ["rencana_strategis_id"], name: "fk_program_rencana_strategis_idx"
    t.index ["satuan_id"], name: "fk_program_satuan_idx"
    t.index ["status_program_id"], name: "fk_program_status_program_idx"
    t.index ["struktur_jabatan_has_mata_anggaran_id"], name: "fk_program_struktur_jabatan_has_mata_anggaran_idx"
  end

  create_table "rakx_program_has_sumber_dana", primary_key: "program_has_sumber_dana_id", id: :integer, force: :cascade do |t|
    t.integer "program_id", null: false
    t.integer "sumber_dana_id", null: false
    t.decimal "jumlah", precision: 19, scale: 4
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["program_id"], name: "fk_program_has_sumber_dana_program_idx"
    t.index ["sumber_dana_id"], name: "fk_program_has_sumber_dana_sumber_dana_idx"
  end

  create_table "rakx_program_has_waktu", primary_key: "program_has_waktu_id", id: :integer, force: :cascade do |t|
    t.integer "program_id", null: false
    t.integer "bulan_id", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["bulan_id"], name: "fk_program_has_waktu_bulan_idx"
    t.index ["program_id"], name: "fk_program_has_waktu_program_idx"
  end

  create_table "rakx_r_bulan", primary_key: "bulan_id", id: :integer, force: :cascade do |t|
    t.integer "bulan", null: false
    t.string "name", limit: 45, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_r_rencana_strategis", primary_key: "rencana_strategis_id", id: :integer, force: :cascade do |t|
    t.string "nomor", limit: 11, null: false
    t.text "name", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_r_satuan", primary_key: "satuan_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_r_standar", primary_key: "standar_id", id: :integer, force: :cascade do |t|
    t.integer "nomor", null: false
    t.text "name", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_r_status_program", primary_key: "status_program_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_r_sumber_dana", primary_key: "sumber_dana_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_r_tahun_anggaran", primary_key: "tahun_anggaran_id", id: :integer, force: :cascade do |t|
    t.integer "tahun", null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "rakx_review_program", primary_key: "review_program_id", id: :integer, force: :cascade do |t|
    t.integer "program_id", null: false
    t.integer "pejabat_id", null: false
    t.text "review", null: false
    t.datetime "tanggal_review", precision: nil, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["pejabat_id"], name: "fk_review_anggaran_pejabat_idx"
    t.index ["program_id"], name: "fk_review_anggaran_program_idx"
    t.index ["tanggal_review"], name: "TANGGAL_REVIEW"
  end

  create_table "rakx_struktur_jabatan_has_mata_anggaran", primary_key: "struktur_jabatan_has_mata_anggaran_id", id: :integer, force: :cascade do |t|
    t.integer "struktur_jabatan_id", null: false
    t.integer "mata_anggaran_id", null: false
    t.integer "tahun_anggaran_id", null: false
    t.decimal "subtotal", precision: 19, scale: 4, default: "0.0"
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["mata_anggaran_id"], name: "fk_struktur_jabatan_has_mata_anggaran_mata_anggaran_idx"
    t.index ["struktur_jabatan_id"], name: "fk_struktur_jabatan_has_mata_anggaran_struktur_jabatan_idx"
    t.index ["tahun_anggaran_id"], name: "fk_struktur_jabatan_has_mata_anggaran_tahun_anggaran_idx"
  end

  create_table "rprt_complaint", primary_key: "complaint_id", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.string "title", limit: 100
    t.integer "bagian_id"
    t.string "location", limit: 100
    t.string "image", limit: 100
    t.text "desc"
    t.integer "status_id"
    t.datetime "estimated_date", precision: nil
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["bagian_id"], name: "FK_rprt_complaint_bagian"
    t.index ["status_id"], name: "FK_rprt_complaint_status"
    t.index ["user_id"], name: "FK_rprt_complaint_user"
  end

  create_table "rprt_r_bagian", primary_key: "bagian_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "rprt_r_status", primary_key: "status_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "rprt_response", primary_key: "response_id", id: :integer, force: :cascade do |t|
    t.integer "complaint_id"
    t.integer "user_id"
    t.string "comment", limit: 200
    t.string "image", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["complaint_id"], name: "FK_rprt_response_complaint"
    t.index ["user_id"], name: "FK_rprt_response_user"
  end

  create_table "rprt_user_has_bagian", primary_key: "user_has_bagian_id", id: :integer, force: :cascade do |t|
    t.integer "user_id"
    t.integer "bagian_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["bagian_id"], name: "FK_rprt_user_has_bagian_bagian"
    t.index ["user_id"], name: "FK_rprt_user_has_bagian_user"
  end

  create_table "schd_event", primary_key: "event_id", id: :integer, force: :cascade do |t|
    t.integer "calender_id", null: false
    t.string "event", limit: 150, null: false
    t.text "desc"
    t.datetime "start", precision: nil, null: false
    t.datetime "end", precision: nil
    t.boolean "all_day", default: false
    t.integer "lokasi_id"
    t.string "lokasi_text", limit: 250
    t.string "status", limit: 25
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["calender_id"], name: "FK_schd_event_calender"
    t.index ["lokasi_id"], name: "FK_schd_event"
  end

  create_table "schd_event_invitee", primary_key: "event_invitee_id", id: :integer, force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["event_id"], name: "FK_schd_event_invitee"
    t.index ["user_id"], name: "FK_schd_event_invitee-user"
  end

  create_table "schd_file_event", primary_key: "file_event_id", id: :integer, force: :cascade do |t|
    t.integer "event_id"
    t.string "nama_file", limit: 200
    t.string "kode_file", limit: 200
    t.text "ket"
    t.integer "ta"
    t.integer "sem_ta"
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["event_id"], name: "FK_schd_file_event_file"
  end

  create_table "schd_jadwal_kuliah", primary_key: "jadwal_kuliah_id", id: :integer, force: :cascade do |t|
    t.integer "kuliah_id"
    t.integer "event_id"
    t.integer "kelas_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["event_id"], name: "FK_schd_jadwal_kuliah"
    t.index ["kelas_id"], name: "FK_schd_jadwal_kuliah_kelas"
    t.index ["kuliah_id"], name: "FK_schd_jadwal_kuliah_kuliah"
  end

  create_table "schd_komsumsi", primary_key: "komsumsi_id", id: :integer, force: :cascade do |t|
    t.integer "schedule_id"
    t.column "komsumsi", "enum('Snack','Makan')"
    t.column "jenis_komsumsi", "enum('Kotak','Prasmanan')"
    t.integer "jumlah_peserta"
    t.column "kelas_komsumsi", "enum('Biasa','VIP')"
    t.column "jenis_peserta", "enum('Internal','Eksternal','Internal dan Eksternal')"
    t.datetime "waktu_pengadaan", precision: nil
    t.integer "approval_sekretariat", limit: 1
    t.text "detail_peserta"
    t.text "catatan"
    t.text "catatan_skretariat"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["schedule_id"], name: "schedule_komsumsi"
  end

  create_table "schd_r_calender", primary_key: "calender_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "desc"
    t.boolean "is_public", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
  end

  create_table "schd_schedule", primary_key: "schedule_id", id: :integer, force: :cascade do |t|
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil
    t.string "nama_event", limit: 225, null: false
    t.text "desc"
    t.boolean "ispublic", default: false
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "schd_schedule_permohonan", primary_key: "schedule_permohonan_id", id: :integer, force: :cascade do |t|
    t.integer "schedule_id"
    t.string "perihal"
    t.text "desc"
    t.integer "bagian_id"
    t.datetime "waktu", precision: nil
    t.integer "user_id"
    t.boolean "proceed"
    t.string "proceed_by", limit: 32
    t.text "catatan"
    t.text "catatan_approval"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["bagian_id"], name: "bagian"
    t.index ["schedule_id"], name: "schedule"
  end

  create_table "schd_schedule_unit", primary_key: "schedule_unit_id", id: :integer, force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "unit_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["schedule_id"], name: "schedule_unit_fk"
  end

  create_table "schd_subscriber", primary_key: "subscriber_id", id: :integer, force: :cascade do |t|
    t.integer "calender_id"
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["calender_id"], name: "FK_schd_subscriber"
  end

  create_table "skkm_bukti_file", primary_key: "bukti_id", id: :integer, force: :cascade do |t|
    t.string "filename", limit: 100, null: false
    t.string "filepath", limit: 100
    t.integer "daftar_kegiatan_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["daftar_kegiatan_id"], name: "FK_daftar_bukti"
  end

  create_table "skkm_daftar_kegiatan_mahasiswa", primary_key: "daftar_kegiatan_id", id: :integer, force: :cascade do |t|
    t.integer "poin_mahasiswa_id"
    t.string "nama_kegiatan", limit: 100
    t.integer "status_id", default: 1
    t.integer "verifikator"
    t.integer "indeks_kegiatan_id"
    t.text "desc"
    t.string "ta", limit: 5
    t.string "sem", limit: 2
    t.float "bobot"
    t.date "dari_tanggal"
    t.date "ke_tanggal"
    t.text "review"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["indeks_kegiatan_id"], name: "id_indeks"
    t.index ["poin_mahasiswa_id"], name: "skkm_daftar_kegiatan_mahasiswa_poin_mahasiswa"
    t.index ["status_id"], name: "skkm_status_daftar_kegiatan"
    t.index ["verifikator"], name: "verifikator_id"
  end

  create_table "skkm_indeks_kegiatan", primary_key: "indeks_kegiatan_id", id: :integer, force: :cascade do |t|
    t.string "nama_kegiatan", null: false
    t.float "bobot", default: 0.0
    t.integer "parent"
    t.string "alias", limit: 500
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["parent"], name: "skkm_parent_indeks_kegiatan"
  end

  create_table "skkm_poin_mahasiswa", primary_key: "poin_mahasiswa_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id", null: false
    t.float "poin", default: 0.0
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "skkm_poin_mahasiswa_dim"
  end

  create_table "skkm_r_poin_prodi_min", primary_key: "poin_prodi_min_id", id: :integer, force: :cascade do |t|
    t.integer "prodi_id", null: false
    t.float "poin_min", default: 0.0, null: false
    t.float "pca_min", default: 0.0
    t.float "matrikulasi_min", default: 0.0
    t.float "other_min", default: 0.0
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["prodi_id"], name: "skkm_poin_prodi_min_inst_prodi"
  end

  create_table "skkm_r_status", primary_key: "status_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["name"], name: "dim_id1"
  end

  create_table "skpi_mahasiswa", primary_key: "skpi_mahasiswa_id", id: :integer, force: :cascade do |t|
    t.date "tanggal_masuk"
    t.integer "pegawai_id"
    t.integer "skpi_prodi_id"
    t.date "tanggal_lulus"
    t.string "nomor_ijazah", limit: 11
    t.string "nomor_skpi", limit: 100
    t.string "lama_studi", limit: 20
    t.integer "dim_id"
    t.string "nim", limit: 20
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 100
    t.integer "status_pengajuan_id"
    t.text "alasan_penolakan"
    t.integer "kop_surat_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "penanda_tangan", limit: 20
    t.date "tanggal_pengesahan"
    t.datetime "waktu_pengambilan", precision: nil
  end

  create_table "skpi_mahasiswa_has_pencapaian", primary_key: "skpi_mahasiswa_has_pencapaian_id", id: :integer, force: :cascade do |t|
    t.integer "skpi_mahasiswa_id"
    t.integer "skpi_pencapaian_id"
    t.string "desc", limit: 200
    t.string "desc_ing", limit: 200
    t.string "nama_file", limit: 125
    t.string "kode_file", limit: 125
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_mahasiswa_has_pencapaian_r", primary_key: "skpi_mahasiswa_has_pencapaian_id", id: :integer, force: :cascade do |t|
    t.integer "skpi_mahasiswa_id"
    t.integer "skpi_pencapaian_id"
    t.text "desc"
    t.text "desc_ing"
    t.string "nama_file", limit: 125
    t.string "kode_file", limit: 125
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_mahasiswa_r", primary_key: "skpi_mahasiswa_id", id: :integer, force: :cascade do |t|
    t.date "tanggal_masuk"
    t.integer "pegawai_id"
    t.integer "skpi_prodi_id"
    t.date "tanggal_lulus"
    t.string "nomor_ijazah", limit: 50
    t.string "nomor_skpi", limit: 100
    t.string "lama_studi", limit: 20
    t.integer "dim_id"
    t.string "nim", limit: 20
    t.integer "nomor_surat"
    t.string "nomor_surat_lengkap", limit: 100
    t.integer "status_pengajuan_id"
    t.text "alasan_penolakan"
    t.integer "kop_surat_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "penanda_tangan", limit: 20
    t.date "tanggal_pengesahan"
    t.datetime "waktu_pengambilan", precision: nil
  end

  create_table "skpi_r_bab", primary_key: "skpi_bab_id", id: :integer, force: :cascade do |t|
    t.integer "no_urut", limit: 1
    t.string "nama_bab_ind", limit: 100
    t.string "nama_bab_ing", limit: 100
    t.text "desc_ind"
    t.text "desc_ing"
    t.integer "skpi_prodi_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_r_bab_r", primary_key: "skpi_bab_id", id: :integer, force: :cascade do |t|
    t.integer "no_urut", limit: 1
    t.string "nama_bab_ind", limit: 100
    t.string "nama_bab_ing", limit: 100
    t.text "desc_ind"
    t.text "desc_ing"
    t.integer "skpi_prodi_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_r_instansi", primary_key: "skpi_instansi_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 100, null: false
    t.string "sk_instansi", limit: 100
    t.string "akreditasi_instansi", limit: 2
    t.string "nama_file_sk_instansi", limit: 100
    t.string "nama_file_akreditasi", limit: 100
    t.integer "tahun", null: false
    t.integer "aktif", limit: 1, default: 1
    t.string "kode_file_sk_instansi", limit: 100
    t.string "kode_file_akreditasi", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_r_instansi_r", primary_key: "skpi_instansi_id", id: :integer, force: :cascade do |t|
    t.string "nama", limit: 100, null: false
    t.string "sk_instansi", limit: 100
    t.string "akreditasi_instansi", limit: 2
    t.string "nama_file_sk_instansi", limit: 100
    t.string "nama_file_akreditasi", limit: 100
    t.integer "tahun", null: false
    t.integer "aktif", limit: 1, default: 1
    t.string "kode_file_sk_instansi", limit: 100
    t.string "kode_file_akreditasi", limit: 100
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_r_pencapaian", primary_key: "pencapaian_id", id: :integer, force: :cascade do |t|
    t.string "nama_ind", limit: 100
    t.string "nama_ing", limit: 100
    t.integer "no_urut"
    t.integer "kbk_ref_id"
    t.integer "skpi_prodi_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_r_pencapaian_r", primary_key: "pencapaian_id", id: :integer, force: :cascade do |t|
    t.string "nama_ind", limit: 100
    t.string "nama_ing", limit: 100
    t.integer "no_urut"
    t.integer "kbk_ref_id"
    t.integer "skpi_prodi_id"
    t.boolean "isrequired", default: true
    t.boolean "is_paragraph", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "skpi_r_prodi", primary_key: "skpi_prodi_id", id: :integer, force: :cascade do |t|
    t.integer "skpi_intansi_id", null: false
    t.integer "ref_kbk_id", null: false
    t.string "akreditasi_prodi", limit: 100
    t.string "nama_prodi_ind", limit: 100
    t.string "nama_prodi_ing", limit: 100
    t.string "jenis_prodi_ind", limit: 50
    t.string "jenis_prodi_ing", limit: 50
    t.string "program_prodi_ind", limit: 100
    t.string "program_prodi_ing", limit: 100
    t.string "gelar_ind", limit: 100
    t.string "gelar_ing", limit: 100
    t.string "akreditasi_by_ind", limit: 100
    t.string "akreditasi_by_ing", limit: 100
    t.string "bahasa_pengantar_ind", limit: 100
    t.string "bahasa_pengantar_ing", limit: 100
    t.string "syarat_penerimaan_ind", limit: 250
    t.string "syarat_penerimaan_ing", limit: 250
    t.string "kkni", limit: 100
    t.string "jenis_jenjang_lanjutan_ind", limit: 250
    t.string "jenis_jenjan_lanjutan_ing", limit: 250
    t.string "sistem_penilaian", limit: 250
    t.string "sk_akreditasi", limit: 100
    t.date "tanggal_akreditasi"
    t.text "perubahan_nama_ind"
    t.text "perubahan_nama_ing"
    t.string "nama_file_sk", limit: 100
    t.string "nama_file_akreditasi", limit: 100
    t.integer "aktif", limit: 1, default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "kode_file_sk", limit: 100
    t.string "kode_file_akreditasi", limit: 100
    t.date "tanggal_berlaku"
    t.date "tanggal_kedaluwarsa"
  end

  create_table "skpi_r_prodi_r", primary_key: "skpi_prodi_id", id: :integer, force: :cascade do |t|
    t.integer "skpi_intansi_id", null: false
    t.integer "ref_kbk_id", null: false
    t.string "akreditasi_prodi", limit: 100
    t.string "akreditasi_prodi_ing", limit: 100
    t.string "nama_prodi_ind", limit: 100
    t.string "nama_prodi_ing", limit: 100
    t.string "jenis_prodi_ind", limit: 50
    t.string "jenis_prodi_ing", limit: 50
    t.string "program_prodi_ind", limit: 100
    t.string "program_prodi_ing", limit: 100
    t.string "gelar_ind", limit: 100
    t.string "gelar_ing", limit: 100
    t.string "akreditasi_by_ind", limit: 100
    t.string "akreditasi_by_ing", limit: 100
    t.string "bahasa_pengantar_ind", limit: 100
    t.string "bahasa_pengantar_ing", limit: 100
    t.string "syarat_penerimaan_ind", limit: 250
    t.string "syarat_penerimaan_ing", limit: 250
    t.string "kkni", limit: 100
    t.string "jenis_jenjang_lanjutan_ind", limit: 250
    t.string "jenis_jenjan_lanjutan_ing", limit: 250
    t.string "sistem_penilaian", limit: 250
    t.string "sk_akreditasi", limit: 100
    t.date "tanggal_akreditasi"
    t.text "perubahan_nama_ind"
    t.text "perubahan_nama_ing"
    t.string "nama_file_sk", limit: 100
    t.string "nama_file_akreditasi", limit: 100
    t.integer "aktif", limit: 1, default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.string "kode_file_sk", limit: 100
    t.string "kode_file_akreditasi", limit: 100
    t.date "tanggal_berlaku"
    t.date "tanggal_kedaluwarsa"
  end

  create_table "skpi_r_subbab", primary_key: "subbab_id", id: :integer, force: :cascade do |t|
    t.text "no_urut", size: :tiny
    t.string "nama_subbab_ind", limit: 100
    t.string "nama_subbab_ing", limit: 100
    t.text "desc_ind"
    t.text "desc_ing"
    t.integer "skpi_bab_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["subbab_id"], name: "subbab_id"
  end

  create_table "skpi_r_subbab_r", primary_key: "subbab_id", id: :integer, force: :cascade do |t|
    t.text "no_urut", size: :tiny
    t.string "nama_subbab_ind", limit: 100
    t.string "nama_subbab_ing", limit: 100
    t.text "desc_ind"
    t.text "desc_ing"
    t.integer "skpi_bab_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["subbab_id"], name: "subbab_id"
  end

  create_table "sppd_biaya_perjalanan", primary_key: "biaya_perjalanan_id", id: :integer, force: :cascade do |t|
    t.integer "surat_tugas_assignee_id"
    t.boolean "status_rencana_sekretariat", default: false
    t.boolean "status_rencana_keuangan", default: false
    t.boolean "status_realisasi_keuangan", default: false
    t.boolean "status_realisasi_dana", default: false
    t.string "no_spj", limit: 100
    t.string "no_surat_pd", limit: 100
    t.date "tanggal_surat"
    t.boolean "status_wr", default: false
    t.boolean "status_koordinator_keuangan", default: false
    t.integer "bagian_keuangan"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["status_realisasi_keuangan"], name: "FK_status_realisasi_keuangan"
    t.index ["status_rencana_keuangan"], name: "FK_status_rencana_keuangan"
    t.index ["status_rencana_sekretariat"], name: "FK_status_rencana_sekretariat"
    t.index ["surat_tugas_assignee_id"], name: "FK_sppd_biaya_perjalanan_st"
  end

  create_table "sppd_biaya_perjalanan_supir", primary_key: "biaya_perjalanan_supir_id", id: :integer, force: :cascade do |t|
    t.integer "laporan_pemakaian_kendaraan_id"
    t.boolean "status_realisasi_keuangan"
    t.decimal "kilometer", precision: 19
    t.date "tanggal_pengambilan"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["biaya_perjalanan_supir_id"], name: "biaya_perjalanan_supir_id", unique: true
    t.index ["laporan_pemakaian_kendaraan_id"], name: "FK_sppd_biaya_perjalanan_supir"
  end

  create_table "sppd_daftar_biaya", primary_key: "daftar_biaya_id", id: :integer, force: :cascade do |t|
    t.integer "biaya_perjalanan_id"
    t.integer "standar_biaya_id"
    t.decimal "nominal_rencana", precision: 19, scale: 4
    t.decimal "nominal_realisasi", precision: 19, scale: 4
    t.text "desc"
    t.text "desc_rencana"
    t.integer "pengali_rencana"
    t.integer "pengali_realisasi"
    t.integer "no_urut_standar"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["biaya_perjalanan_id"], name: "FK_biaya_perjalanan"
    t.index ["standar_biaya_id"], name: "FK_sppd_daftar_biaya"
  end

  create_table "sppd_daftar_biaya_supir", primary_key: "daftar_biaya_supir_id", id: :integer, force: :cascade do |t|
    t.integer "standar_biaya_supir_id"
    t.integer "biaya_perjalanan_supir_id"
    t.decimal "nominal_realisasi", precision: 19, scale: 4
    t.integer "banyak_hari"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["biaya_perjalanan_supir_id"], name: "FK_sppd_daftar_biaya_supir_bp"
    t.index ["standar_biaya_supir_id"], name: "FK_sppd_daftar_biaya_supir"
  end

  create_table "sppd_kategori_biaya", primary_key: "kategori_biaya_id", id: :integer, force: :cascade do |t|
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "sppd_kategori_biaya_supir", primary_key: "kategori_biaya_supir_id", id: :integer, force: :cascade do |t|
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "sppd_standar_biaya", primary_key: "standar_biaya_id", id: :integer, force: :cascade do |t|
    t.integer "kategori_biaya_id"
    t.decimal "biaya", precision: 19
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["kategori_biaya_id"], name: "FK_kategori_biaya"
  end

  create_table "sppd_standar_biaya_supir", primary_key: "standar_biaya_supir_id", id: :integer, force: :cascade do |t|
    t.integer "kategori_biaya_supir_id"
    t.decimal "biaya", precision: 19
    t.text "desc"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["kategori_biaya_supir_id"], name: "FK_sppd_standar_biaya_supir"
  end

  create_table "srvy_kuesioner", primary_key: "kuesioner_id", id: :integer, force: :cascade do |t|
    t.integer "sem", default: 0, null: false
    t.integer "ta", default: 0, null: false
    t.string "kode_mk", limit: 11
    t.integer "pegawai_id"
    t.string "nama", default: "", null: false
    t.text "keterangan"
    t.text "instruksi_pengisian"
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil, null: false
    t.text "peserta_kuis"
    t.string "is_login", limit: 1, default: "1", null: false
    t.float "nilai"
    t.boolean "wajib", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.integer "id_kuesioner"
    t.index ["kuesioner_id"], name: "ID_KUESIONER"
    t.index ["pegawai_id"], name: "pegawai_id"
  end

  create_table "srvy_kuesioner_jawaban_peserta", primary_key: "kuesioner_jawaban_peserta_id", id: :integer, force: :cascade do |t|
    t.integer "kuesioner_id"
    t.integer "kuesioner_pertanyaan_id"
    t.text "jawaban"
    t.string "peserta", limit: 30, default: "0"
    t.integer "user_id"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.integer "id_kuesioner", default: 0
    t.string "id_pertanyaan", limit: 20
    t.index ["kuesioner_id"], name: "FK_srvy_kuesioner_jawaban_peserta_kuesioner"
    t.index ["kuesioner_pertanyaan_id"], name: "FK_srvy_kuesioner_jawaban_peserta"
    t.index ["user_id"], name: "FK_srvy_kuesioner_jawaban_peserta_user"
  end

  create_table "srvy_kuesioner_opsi", primary_key: "kuesioner_opsi_id", id: :integer, force: :cascade do |t|
    t.integer "no_opsi", null: false
    t.integer "kuesioner_pertanyaan_id"
    t.text "ket_opsi", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.string "id_pertanyaan", limit: 20, default: "0"
    t.index ["kuesioner_opsi_id"], name: "NO_OPSI"
    t.index ["kuesioner_pertanyaan_id"], name: "FK_srvy_kuesioner_opsi_pertanyaan"
  end

  create_table "srvy_kuesioner_pertanyaan", primary_key: "kuesioner_pertanyaan_id", id: :integer, force: :cascade do |t|
    t.integer "kuesioner_id"
    t.integer "nomor"
    t.text "pertanyaan"
    t.column "tipe_opsi", "enum('C','R','T')", default: "R", null: false
    t.string "kategori", limit: 200
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.integer "id_kuesioner", default: 0
    t.string "id_pertanyaan", limit: 20
    t.index ["id_kuesioner"], name: "ID_KUESIONER"
    t.index ["id_pertanyaan"], name: "ID_PERTANYAAN"
    t.index ["kuesioner_id"], name: "fk_t_kuesioner_pertanyaan_t_kuesioner1_idx"
  end

  create_table "srvy_polling", primary_key: "polling_id", id: :integer, force: :cascade do |t|
    t.string "poll_id", limit: 20
    t.string "kategori", limit: 50, default: "All"
    t.string "judul"
    t.text "pertanyaan"
    t.text "ket"
    t.datetime "tgl_exp", precision: nil
    t.datetime "tgl_view", precision: nil
    t.boolean "wajib", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["poll_id"], name: "POLL_ID_UNIQUE", unique: true
  end

  create_table "srvy_pollopsi", primary_key: "pollopsi_id", id: :integer, force: :cascade do |t|
    t.string "poll_id", limit: 20
    t.integer "no_opsi", limit: 2, default: 0
    t.integer "polling_id"
    t.string "opsi"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["polling_id"], name: "fk_t_POLLOPSI_t_POLLING1_idx"
  end

  create_table "srvy_pollvote", primary_key: "pollvote_id", id: :integer, force: :cascade do |t|
    t.string "poll_id", limit: 20
    t.integer "polling_id"
    t.integer "no_opsi", limit: 2, default: 0
    t.integer "pollopsi_id"
    t.integer "vote_by"
    t.string "vote_by_old", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["polling_id"], name: "FK_srvy_pollvote_polling_id"
    t.index ["pollopsi_id"], name: "FK_t_pollvote"
  end

  create_table "srvy_workgroup_kuesioner", id: false, force: :cascade do |t|
    t.integer "workgroup_id"
    t.integer "kuesioner_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.index ["kuesioner_id"], name: "FK_srvy_workgroup_kuesioner_kuesioner"
    t.index ["workgroup_id"], name: "FK_srvy_workgroup_kuesioner_wg"
  end

  create_table "srvy_workgroup_polling", id: false, force: :cascade do |t|
    t.integer "workgroup_id"
    t.integer "polling_id"
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["polling_id"], name: "FK_srvy_workgroup_polling_poll"
    t.index ["workgroup_id"], name: "FK_srvy_workgroup_polling_wk"
  end

  create_table "sysx_action", primary_key: "action_id", id: :integer, force: :cascade do |t|
    t.integer "controller_id", null: false
    t.string "identifier", limit: 32, null: false, comment: "Action Unique ID"
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["controller_id"], name: "fk_action_controller1_idx"
  end

  create_table "sysx_application", primary_key: "application_id", id: :integer, force: :cascade do |t|
    t.string "identifier", limit: 32, null: false, comment: "Application Unique ID"
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "sysx_authentication_method", primary_key: "authentication_method_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "server_address", limit: 45
    t.string "authentication_string"
    t.string "desc"
    t.boolean "redirected", default: false
    t.integer "redirect_to"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "sysx_config", primary_key: "config_id", id: :integer, force: :cascade do |t|
    t.integer "application_id", null: false
    t.string "key", limit: 100, null: false
    t.string "value", limit: 2000
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 45
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 45
    t.index ["application_id"], name: "fk_config_application1_idx"
  end

  create_table "sysx_config_backup", primary_key: "config_id", id: :integer, force: :cascade do |t|
    t.integer "application_id", null: false
    t.string "key", limit: 100, null: false
    t.string "value"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 45
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 45
    t.index ["application_id"], name: "fk_config_application1_idx"
  end

  create_table "sysx_controller", primary_key: "controller_id", id: :integer, force: :cascade do |t|
    t.integer "module_id", null: false
    t.string "identifier", limit: 32, null: false, comment: "Controller Unique ID"
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["module_id"], name: "fk_controller_module1_idx"
  end

  create_table "sysx_job_allocation", primary_key: "job_allocation_id", id: :integer, force: :cascade do |t|
    t.integer "job_definition_id", null: false
    t.datetime "start", precision: nil, null: false
    t.datetime "end", precision: nil, null: false
    t.string "desc"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.index ["job_definition_id"], name: "fk_job_allocation_job_definition1_idx"
  end

  create_table "sysx_job_definition", primary_key: "job_definition_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "desc"
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
  end

  create_table "sysx_log", primary_key: "log_id", id: :integer, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "message", limit: 500
    t.string "host", limit: 45
    t.datetime "datetime", precision: nil
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["user_id"], name: "fk_Log_user1_idx"
  end

  create_table "sysx_menu_group", primary_key: "menu_group_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "sysx_menu_item", primary_key: "menu_item_id", id: :integer, force: :cascade do |t|
    t.integer "menu_group_id", null: false
    t.integer "parent_id"
    t.string "label", limit: 100
    t.string "alt", limit: 100
    t.string "url"
    t.string "icon", limit: 100
    t.boolean "is_ajax", default: false, null: false
    t.string "container_id", limit: 45
    t.boolean "disabled", default: false
    t.integer "order_number", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["menu_group_id"], name: "fk_menu_item_menu_group1_idx"
  end

  create_table "sysx_module", primary_key: "module_id", id: :integer, force: :cascade do |t|
    t.integer "application_id", null: false
    t.string "identifier", limit: 32, null: false, comment: "Module Unique ID"
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["application_id"], name: "fk_module_application1_idx"
  end

  create_table "sysx_permission", primary_key: "permission_id", id: :integer, force: :cascade do |t|
    t.integer "action_id", null: false
    t.string "identifier", limit: 32, null: false, comment: "Permission Unique ID"
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["action_id"], name: "fk_permission_action1_idx"
  end

  create_table "sysx_profile", primary_key: "profile_id", id: :integer, force: :cascade do |t|
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "address"
    t.string "avatar_url"
    t.string "email_2", limit: 100
    t.string "mobile_phone_1", limit: 45
    t.string "mobile_phone_2", limit: 45
    t.string "facebook"
    t.string "twitter", limit: 100
    t.string "website"
    t.boolean "deleted", default: false
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 45
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 45
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "sysx_role", primary_key: "role_id", id: :integer, force: :cascade do |t|
    t.integer "parent_id"
    t.string "name", limit: 45
    t.string "desc"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
  end

  create_table "sysx_role_has_action", primary_key: ["role_id", "action_id"], force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "action_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["action_id"], name: "fk_role_has_action_action1_idx"
    t.index ["role_id"], name: "fk_role_has_action_role1_idx"
  end

  create_table "sysx_role_has_application", primary_key: ["role_id", "application_id"], force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "application_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["application_id"], name: "fk_role_has_application_application1_idx"
    t.index ["role_id"], name: "fk_role_has_application_role1_idx"
  end

  create_table "sysx_role_has_controller", primary_key: ["role_id", "controller_id"], force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "controller_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["controller_id"], name: "fk_role_has_controller_controller1_idx"
    t.index ["role_id"], name: "fk_role_has_controller_role1_idx"
  end

  create_table "sysx_role_has_menu_item", primary_key: ["menu_item_id", "role_id"], force: :cascade do |t|
    t.integer "menu_item_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["menu_item_id"], name: "fk_menu_item_has_role_menu_item1_idx"
    t.index ["role_id"], name: "fk_menu_item_has_role_role1_idx"
  end

  create_table "sysx_role_has_module", primary_key: ["role_id", "module_id"], force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "module_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["module_id"], name: "fk_role_has_module_module1_idx"
    t.index ["role_id"], name: "fk_role_has_module_role1_idx"
  end

  create_table "sysx_role_has_permission", primary_key: ["role_id", "permission_id"], force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "permission_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["permission_id"], name: "fk_role_has_permission_permission2_idx"
    t.index ["role_id"], name: "fk_role_has_permission_role2_idx"
  end

  create_table "sysx_role_has_task", primary_key: ["role_id", "task_id"], force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["role_id"], name: "fk_role_has_permission_role1_idx"
    t.index ["task_id"], name: "fk_role_has_permission_permission1_idx"
  end

  create_table "sysx_task", primary_key: "task_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "desc", limit: 100
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["name"], name: "name_UNIQUE", unique: true
  end

  create_table "sysx_telkom_sso_user", primary_key: "telkom_sso_user_id", id: :integer, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "username", limit: 100, null: false
    t.string "password_hash", null: false
    t.boolean "forward_auth", default: false, comment: "Forward authentication to local authentication system, or terminate here with provided password"
    t.boolean "active", default: false
    t.boolean "deleted", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.index ["user_id"], name: "FK_sysx_telkom_sso_user"
  end

  create_table "sysx_telkom_sso_user_log", primary_key: "telkom_sso_user_log_id", id: :integer, force: :cascade do |t|
    t.integer "telkom_sso_user_id", null: false
    t.string "action", limit: 45
    t.string "status", limit: 45
    t.string "message"
    t.datetime "timestamp", precision: nil
    t.index ["telkom_sso_user_id"], name: "FK_sysx_telkom_sso_user_log"
  end

  create_table "sysx_user", primary_key: "user_id", id: :integer, force: :cascade do |t|
    t.integer "profile_id"
    t.string "sysx_key", limit: 32
    t.integer "authentication_method_id", default: 1, null: false
    t.string "username", null: false
    t.string "auth_key", limit: 32, null: false
    t.string "password_hash", null: false
    t.string "password_reset_token"
    t.string "email", null: false
    t.integer "status", limit: 2, default: 10, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["authentication_method_id"], name: "fk_user_authentication_method1_idx"
    t.index ["profile_id"], name: "fk_user_profile1_idx"
  end

  create_table "sysx_user_config", primary_key: "user_config_id", id: :integer, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "application_id", null: false
    t.string "key", limit: 100, null: false
    t.string "value", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.index ["application_id"], name: "fk_sysx_user_config_sysx_application1_idx"
    t.index ["user_id"], name: "fk_sysx_user_config_sysx_user1_idx"
  end

  create_table "sysx_user_has_role", primary_key: ["role_id", "user_id"], force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 45
    t.string "updated_by", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.index ["role_id"], name: "fk_user_has_role_role1_idx"
    t.index ["user_id"], name: "fk_user_has_role_user_idx"
  end

  create_table "sysx_user_has_workgroup", primary_key: ["user_id", "workgroup_id"], force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "workgroup_id", null: false
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["workgroup_id"], name: "fk_user_has_workgroup_workgroup1_idx"
  end

  create_table "sysx_workgroup", primary_key: "workgroup_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "desc"
    t.boolean "protected", default: false
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 45
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 45
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 45
  end

  create_table "tmbh_agenda", primary_key: "agenda_id", id: :integer, force: :cascade do |t|
    t.string "id_agenda", limit: 20, default: "", null: false
    t.string "judul"
    t.string "kategori"
    t.text "isi", size: :long
    t.string "status", limit: 1, default: "1"
    t.datetime "tgl_start", precision: nil, null: false
    t.datetime "tgl_end", precision: nil, null: false
    t.integer "waktu_notifikasi"
    t.string "notifikasi_by_email", limit: 1, default: "0", null: false
    t.string "notifikasi_by_popup", limit: 1, default: "0", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["id_agenda"], name: "AGENDA_ID_UNIQUE", unique: true
  end

  create_table "tmbh_booking", primary_key: "booking_id", id: { type: :integer, unsigned: true }, force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "room_id", null: false, unsigned: true
    t.integer "schedule_id"
    t.text "title", null: false
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil
    t.column "status", "enum('pending','canceled','accepted','rejected')", default: "pending", null: false
    t.string "feedback"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.string "deleted_by", limit: 32
    t.boolean "deleted", default: false
    t.integer "approved_by"
    t.integer "rejected_by"
    t.index ["room_id"], name: "bookings_room_id_foreign"
    t.index ["schedule_id"], name: "schedule_id"
    t.index ["user_id"], name: "bookings_user_id_foreign"
  end

  create_table "tmbh_file_pengumuman", primary_key: "file_pengumuman_id", id: :integer, force: :cascade do |t|
    t.text "nama_file", null: false
    t.string "kode_file", limit: 50
    t.text "ket", null: false
    t.integer "pengumuman_id"
    t.boolean "deleted", default: false
    t.string "deleted_by", limit: 32
    t.datetime "deleted_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.index ["pengumuman_id"], name: "FK_tmbh_file_pengumuman"
  end

  create_table "tmbh_kamus_it", primary_key: "kamus_it_id", id: :integer, force: :cascade do |t|
    t.string "word", default: "", null: false
    t.text "keterangan"
    t.string "kategori", limit: 30
    t.string "status", limit: 1, default: "1"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["word"], name: "WORD"
    t.index ["word"], name: "WORD_UNIQUE", unique: true
  end

  create_table "tmbh_kegiatan", primary_key: "kegiatan_id", id: :integer, force: :cascade do |t|
    t.string "nama_kegiatan", default: "", null: false
    t.string "penyelengara", limit: 100
    t.date "tanggal_mulai"
    t.date "tanggal_akhir"
    t.text "keterangan"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "tmbh_news", primary_key: "news_id", id: :integer, force: :cascade do |t|
    t.integer "news_kategori_id"
    t.string "id_news", limit: 20, default: "", null: false
    t.string "judul"
    t.string "kat_id", limit: 30
    t.string "ket_gambar"
    t.text "pre"
    t.text "isi", size: :long
    t.string "sumber", limit: 50
    t.string "url"
    t.string "status", limit: 1, default: "1"
    t.string "listing", limit: 1, default: "1"
    t.string "komentar", limit: 1, default: "0"
    t.string "language", limit: 3, default: "INA", null: false
    t.datetime "tgl_start", precision: nil, null: false
    t.datetime "tgl_end", precision: nil, null: false
    t.bigint "last_post", default: 0, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["judul"], name: "JUDUL"
    t.index ["news_kategori_id"], name: "fk_t_NEWS_t_NEWS_KATEGORI1_idx"
  end

  create_table "tmbh_news_files", primary_key: "news_files_id", id: :integer, force: :cascade do |t|
    t.string "id_news", limit: 20, default: "0", null: false
    t.string "nama_file", default: "", null: false
    t.string "ket"
    t.string "tipe", limit: 50
    t.integer "size"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
  end

  create_table "tmbh_news_kategori", primary_key: "news_kategori_id", id: :integer, force: :cascade do |t|
    t.string "kat_id", limit: 30, null: false
    t.string "pkat_id", limit: 30
    t.string "kat_nama_ina", default: "", null: false
    t.string "kat_nama_eng"
    t.string "kat_ket"
    t.binary "kat_icon"
    t.integer "no_urut", limit: 2, default: 0, null: false
    t.string "kat_list", limit: 1, default: "1", null: false
    t.string "tipe", limit: 30, default: "konten", null: false
    t.string "menu"
    t.string "params"
    t.string "put_as_menu", limit: 30, default: "", null: false
    t.string "views", limit: 1, default: "1", null: false
    t.string "r_akses"
    t.string "w_akses"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kat_id"], name: "KAT_ID"
    t.index ["kat_id"], name: "KAT_ID_UNIQUE", unique: true
    t.index ["kat_nama_eng"], name: "KAT_NAMA_ENG"
    t.index ["kat_nama_ina"], name: "KAT_NAMA_INA"
    t.index ["pkat_id"], name: "PKAT_ID"
  end

  create_table "tmbh_news_komentar", primary_key: "news_komentar_id", id: :integer, force: :cascade do |t|
    t.string "id_komentar", limit: 10, default: "", null: false
    t.string "id_news", limit: 20, default: "", null: false
    t.string "id_parent", limit: 10
    t.string "judul"
    t.text "isi", size: :long
    t.string "pengirim", limit: 50
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["id_komentar"], name: "ID_KOMENTAR"
    t.index ["judul"], name: "JUDUL"
  end

  create_table "tmbh_pengumuman", primary_key: "pengumuman_id", id: :integer, force: :cascade do |t|
    t.string "id", limit: 10, default: "", null: false
    t.string "kategori", limit: 50, default: "", null: false
    t.string "judul"
    t.string "color", limit: 50
    t.text "isi", size: :long
    t.date "tgl_exp"
    t.string "post_web", limit: 1, default: "1", null: false
    t.string "post_dinding", limit: 1, default: "0", null: false
    t.string "post_mail", limit: 1, default: "0", null: false
    t.string "done_tempel", limit: 1, default: "0", null: false
    t.string "done_cabut", limit: 1, default: "0", null: false
    t.string "isSticky", limit: 1, default: "0"
    t.integer "owner"
    t.string "user_old", limit: 45
    t.boolean "deleted"
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["owner"], name: "FK_tmbh_pengumuman"
  end

  create_table "tmbh_room", primary_key: "room_id", id: { type: :integer, unsigned: true }, force: :cascade do |t|
    t.string "kode", null: false
    t.string "nama", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.string "deleted_by", limit: 32
    t.boolean "deleted", default: false
    t.integer "kapasitas"
    t.text "fasilitas"
    t.index ["kode"], name: "rooms_room_code_unique", unique: true
  end

  create_table "tmbh_software_tools", primary_key: "software_tools_id", id: :integer, force: :cascade do |t|
    t.integer "id_kur", default: 0, null: false
    t.string "kode_mk", limit: 8, null: false
    t.string "name", default: "", null: false
    t.integer "kurikulum_id", null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by", limit: 32
    t.string "updated_by", limit: 32
    t.index ["kurikulum_id"], name: "fk_t_software_tools_t_kurikulum1_idx"
  end

  create_table "ubux_data_paket", primary_key: "data_paket_id", id: :integer, force: :cascade do |t|
    t.integer "tag"
    t.integer "dim_id"
    t.integer "pegawai_id"
    t.string "pengirim", limit: 32
    t.datetime "tanggal_kedatangan", precision: nil, null: false
    t.string "diambil_oleh", limit: 32
    t.datetime "tanggal_diambil", precision: nil
    t.integer "posisi_paket_id"
    t.integer "status_paket_id"
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["dim_id"], name: "fk_dim"
    t.index ["pegawai_id"], name: "fk_pegawai"
    t.index ["posisi_paket_id"], name: "fk_posisi"
    t.index ["status_paket_id"], name: "fk_status"
  end

  create_table "ubux_data_paket_backup16032023", id: false, force: :cascade do |t|
    t.integer "data_paket_id", default: 0, null: false
    t.integer "tag"
    t.integer "dim_id"
    t.integer "pegawai_id"
    t.string "pengirim", limit: 32
    t.datetime "tanggal_kedatangan", precision: nil, null: false
    t.string "diambil_oleh", limit: 32
    t.datetime "tanggal_diambil", precision: nil
    t.integer "posisi_paket_id"
    t.integer "status_paket_id"
    t.text "desc"
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_data_tamu", primary_key: "data_tamu_id", id: :integer, force: :cascade do |t|
    t.string "nik", limit: 32
    t.string "nama", limit: 32
    t.datetime "waktu_kedatangan", precision: nil, null: false
    t.text "desc"
    t.datetime "waktu_kembali", precision: nil
    t.string "kendaraan", limit: 32
    t.boolean "type", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.string "created_by", limit: 32
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_kendaraan", primary_key: "kendaraan_id", id: :integer, force: :cascade do |t|
    t.string "kendaraan", limit: 100, null: false
    t.integer "daya_tampung_kendaraan", null: false
    t.string "plat_nomor", limit: 50, default: "-", null: false
    t.boolean "status", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_laporan_pemakaian_kendaraan", primary_key: "laporan_pemakaian_kendaraan_id", id: :integer, force: :cascade do |t|
    t.integer "pemakaian_kendaraan_id", null: false
    t.text "tujuan", null: false
    t.text "desc", null: false
    t.integer "jumlah_penumpang", null: false
    t.text "keperluan", null: false
    t.datetime "waktu_keberangkatan", precision: nil, null: false
    t.datetime "waktu_tiba", precision: nil, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.integer "kendaraan_id"
    t.integer "supir_id"
    t.index ["kendaraan_id"], name: "kendaraan_id"
    t.index ["pemakaian_kendaraan_id"], name: "ubux_pemakaian_kendaraaan_id"
    t.index ["supir_id"], name: "fk_ubux_laporan_pemakaian_kendaraan_ubux_supir1_idx"
  end

  create_table "ubux_pemakaian_kendaraan", primary_key: "pemakaian_kendaraan_id", id: :integer, force: :cascade do |t|
    t.integer "pemakaian_kendaraan_mhs_id"
    t.integer "pegawai_id"
    t.text "desc", null: false
    t.text "tujuan", null: false
    t.integer "jumlah_penumpang_kendaraan", default: 1, null: false
    t.datetime "rencana_waktu_keberangkatan", precision: nil, null: false
    t.datetime "rencana_waktu_kembali", precision: nil, null: false
    t.integer "status_req_sekretaris_rektorat", default: 1, null: false
    t.integer "status_request_kemahasiswaan", default: 1, null: false
    t.integer "jenis_keperluan_id", default: 1, null: false
    t.string "proposal", limit: 100, default: "-", null: false
    t.string "no_telepon", limit: 32, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32, default: "-"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32, default: "-"
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32, default: "-"
    t.integer "kendaraan_id"
    t.integer "supir_id"
    t.string "no_hp_supir", limit: 300, default: "-", null: false
    t.integer "status_request_kabiro_KSD", default: 1, null: false
    t.decimal "biaya", precision: 19, scale: 4
    t.boolean "konfirmasi_keuangan", default: false, null: false
    t.integer "status_request_wr2", default: 1, null: false
    t.boolean "laporan", default: false
    t.index ["jenis_keperluan_id"], name: "role"
    t.index ["kendaraan_id"], name: "kendaraan_id"
    t.index ["pegawai_id"], name: "pegawai_id"
    t.index ["pemakaian_kendaraan_mhs_id"], name: "transaksi_kendaraan_mahasiswa_id"
    t.index ["supir_id"], name: "Supir"
  end

  create_table "ubux_pemakaian_kendaraan_mhs", primary_key: "pemakaian_kendaraan_mhs_id", id: :integer, force: :cascade do |t|
    t.integer "dim_id", null: false
    t.text "desc", null: false
    t.text "tujuan", null: false
    t.integer "jumlah_penumpang_kendaraan", default: 1, null: false
    t.datetime "rencana_waktu_keberangkatan", precision: nil, null: false
    t.datetime "rencana_waktu_kembali", precision: nil, null: false
    t.integer "status_req_sekretaris_rektorat", default: 1, null: false
    t.integer "status_request_kemahasiswaan", default: 1, null: false
    t.string "proposal", limit: 100, default: "-", null: false
    t.string "no_telepon", limit: 32, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32, default: "-"
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32, default: "-"
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32, default: "-"
    t.integer "kendaraan_id"
    t.integer "supir_id"
    t.string "no_hp_supir", limit: 300, default: "-", null: false
    t.string "kode_proposal", limit: 100
    t.index ["dim_id"], name: "dim_id"
    t.index ["kendaraan_id"], name: "kendaraan_id"
    t.index ["status_req_sekretaris_rektorat"], name: "FK_ubux_referensi_1"
    t.index ["status_request_kemahasiswaan"], name: "FK_ubux_referensi_2"
    t.index ["supir_id"], name: "Supir"
  end

  create_table "ubux_r_jenis_keperluan", primary_key: "jenis_keperluan_id", id: :integer, force: :cascade do |t|
    t.string "jenis_keperluan", limit: 100, null: false
    t.integer "deleted", limit: 1, default: 0, null: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_r_lokasi_log", primary_key: "lokasi_log_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45
    t.string "desc", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "created_by", limit: 45
    t.datetime "created_at", precision: nil
    t.string "updated_by", limit: 45
    t.datetime "updated_at", precision: nil
  end

  create_table "ubux_r_posisi_paket", primary_key: "posisi_paket_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 45
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_r_status_paket", primary_key: "status_paket_id", id: :integer, force: :cascade do |t|
    t.string "status", limit: 32
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_r_status_request", primary_key: "status_request_id", id: :integer, force: :cascade do |t|
    t.string "status", limit: 100, null: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
  end

  create_table "ubux_supir", primary_key: "supir_id", id: :integer, force: :cascade do |t|
    t.integer "pegawai_id", default: 0, null: false
    t.string "no_telepon_supir", limit: 32, null: false
    t.boolean "status", default: false
    t.boolean "deleted", default: false
    t.datetime "deleted_at", precision: nil
    t.string "deleted_by", limit: 32
    t.datetime "created_at", precision: nil
    t.string "created_by", limit: 32
    t.datetime "updated_at", precision: nil
    t.string "updated_by", limit: 32
    t.index ["pegawai_id"], name: "hrdx_pegawai_id"
  end

  create_table "user_refresh_tokens", primary_key: "user_refresh_tokenID", id: { type: :integer, unsigned: true }, force: :cascade do |t|
    t.integer "urf_userID", null: false, unsigned: true
    t.string "urf_token", limit: 1000, null: false
    t.string "urf_ip", limit: 50, null: false
    t.string "urf_user_agent", limit: 1000, null: false
    t.datetime "urf_created", precision: nil, null: false, comment: "UTC"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "absn_absensi", "absn_sesi_kuliah", column: "sesi_kuliah_id", primary_key: "sesi_kuliah_id", name: "FK_absn_absensi_sesi_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_absensi", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_absn_absensi_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_kelas_absensi", "adak_penugasan_pengajaran", column: "penugasan_pengajaran_id", primary_key: "penugasan_pengajaran_id", name: "fk_absn_kelas_absensi_penugasan_pengajaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_kelas_absensi", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_absn_kelas_absensi_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_mahasiswa_tidak_hadir", "absn_sesi_kuliah", column: "sesi_kuliah_id", primary_key: "sesi_kuliah_id", name: "absn_mahasiswa_tidak_hadir_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_mahasiswa_tidak_hadir", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "absn_mahasiswa_tidak_hadir_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_sesi_kuliah", "adak_penugasan_pengajaran", column: "penugasan_pengajaran_id", primary_key: "penugasan_pengajaran_id", name: "FK_absn_sesi_kuliah_penugasan_pengajaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_sesi_kuliah", "dimx_dim", column: "penutup_periode", primary_key: "dim_id", name: "fk_absn_sesi_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "absn_sesi_kuliah", "mref_r_lokasi", column: "lokasi_id", primary_key: "lokasi_id", name: "FK_absn_sesi_kuliah_lokasi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_dim_transfer", "adak_registrasi", column: "registrasi_id", primary_key: "registrasi_id", name: "adak_dim_transfer_ibfk_2"
  add_foreign_key "adak_dim_transfer", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "adak_dim_transfer_ibfk_1"
  add_foreign_key "adak_kelas", "hrdx_dosen", column: "dosen_wali_id", primary_key: "dosen_id", name: "FK_adak_kelas_wali", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_kelas", "inst_prodi", column: "prodi_id", primary_key: "ref_kbk_id", name: "gk_adak_kelas_inst_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_kuliah_transfer", "adak_dim_transfer", column: "dim_transfer_id", primary_key: "dim_transfer_id", name: "adak_kuliah_transfer_ibfk_1"
  add_foreign_key "adak_kuliah_transfer", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "adak_kuliah_transfer_ibfk_3"
  add_foreign_key "adak_kuliah_transfer", "nlai_nilai", column: "nilai_id", primary_key: "nilai_id", name: "adak_kuliah_transfer_ibfk_2"
  add_foreign_key "adak_mahasiswa_assistant", "adak_pengajaran", column: "pengajaran_id", primary_key: "pengajaran_id", name: "FK_adak_mahasiswa_assistant_pengajaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_mahasiswa_assistant", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_adak_mahasiswa_assistant_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_pengajaran", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_adak_pengajaran_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_penugasan_pengajaran", "adak_pengajaran", column: "pengajaran_id", primary_key: "pengajaran_id", name: "FK_adak_penugasan_pengajaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_penugasan_pengajaran", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_adak_penugasan_pengajaran_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_penugasan_pengajaran", "mref_r_role_pengajar", column: "role_pengajar_id", primary_key: "role_pengajar_id", name: "FK_prkl_pengajaran_role_pengajar", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_registrasi", "adak_kelas", column: "kelas_id", primary_key: "kelas_id", name: "FK_prkl_registrasi_kelas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_registrasi", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_registrasi_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_registrasi", "hrdx_pegawai", column: "dosen_wali_id", primary_key: "pegawai_id", name: "FK_adak_registrasi_dosen_wali", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_tidak_spp", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "tidak_spp_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "adak_transfer_file", "adak_dim_transfer", column: "dim_transfer_id", primary_key: "dim_transfer_id", name: "adak_transfer_file_ibfk_1"
  add_foreign_key "akmx_aktivitas_kegiatan", "akmx_r_jenis_aktivitas", column: "jenis_aktivitas_id", primary_key: "jenis_aktivitas_id", name: "akmx_aktivitas_kegiatan_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_aktivitas_kegiatan", "mref_r_sem_ta", column: "sem", primary_key: "sem_ta_id", name: "akmx_aktivitas_kegiatan_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_dosen_pembimbing", "akmx_aktivitas_kegiatan", column: "aktivitas_kegiatan_id", primary_key: "aktivitas_kegiatan_id", name: "akmx_dosen_pembimbing_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_dosen_pembimbing", "feeder_kategori_kegiatan_dosen", column: "kategori_kegiatan_id", primary_key: "kategori_kegiatan_dosen_id", name: "akmx_dosen_pembimbing_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_dosen_pembimbing", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "akmx_dosen_pembimbing_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_dosen_penguji", "akmx_aktivitas_kegiatan", column: "aktivitas_kegiatan_id", primary_key: "aktivitas_kegiatan_id", name: "akmx_dosen_penguji_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_dosen_penguji", "feeder_kategori_kegiatan_dosen", column: "kategori_kegiatan_id", primary_key: "kategori_kegiatan_dosen_id", name: "akmx_dosen_penguji_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_dosen_penguji", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "akmx_dosen_penguji_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_peserta", "akmx_aktivitas_kegiatan", column: "aktivitas_kegiatan_id", primary_key: "aktivitas_kegiatan_id", name: "akmx_peserta_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_peserta", "akmx_r_peran_peserta", column: "peran_peserta_id", primary_key: "peran_peserta_id", name: "akmx_peserta_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "akmx_peserta", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "akmx_peserta_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "arsp_arsip", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_arsip_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "arsp_arsip_file", "arsp_arsip", column: "arsip_id", primary_key: "arsip_id", name: "FK_arsip_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "artk_post", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_artk_post_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "artk_post_attachment", "artk_post", column: "post_id", primary_key: "post_id", name: "FK_artk_post_attachment", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_absensi", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "askm_absensi_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_dim_kamar", "askm_kamar", column: "kamar_id", primary_key: "kamar_id", name: "askm_dim_kamar_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_dim_kamar", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "askm_dim_kamar_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_dim_pelanggaran", "askm_dim_penilaian", column: "penilaian_id", primary_key: "penilaian_id", name: "askm_dim_pelanggaran_ibfk_2"
  add_foreign_key "askm_dim_pelanggaran", "askm_pembinaan", column: "pembinaan_id", primary_key: "pembinaan_id", name: "askm_dim_pelanggaran_ibfk_1"
  add_foreign_key "askm_dim_pelanggaran", "askm_poin_pelanggaran", column: "poin_id", primary_key: "poin_id", name: "askm_dim_pelanggaran_ibfk_3"
  add_foreign_key "askm_dim_penilaian", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "askm_dim_penilaian_ibfk_1"
  add_foreign_key "askm_izin_bermalam", "askm_dim_pelanggaran", column: "pelanggaran_id", primary_key: "pelanggaran_id", name: "askm_izin_bermalam_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_bermalam", "askm_r_status_request", column: "status_request_id", primary_key: "status_request_id", name: "fk_askm_izin_bermalam_askm_r_status_request1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_bermalam", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_askm_izin_bermalam_dimx_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_bermalam", "hrdx_pegawai", column: "keasramaan_id", primary_key: "pegawai_id", name: "askm_izin_bermalam_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_bermalam", "ubux_r_lokasi_log", column: "lokasi_log_id", primary_key: "lokasi_log_id", name: "fk_askm_izin_bermalam_lokasi_log", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_dosen_matkul", "adak_pengajaran", column: "pengajaran_id", primary_key: "pengajaran_id", name: "askm_izin_dosen_matkul_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_dosen_matkul", "askm_izin_keluar", column: "izin_keluar_id", primary_key: "izin_keluar_id", name: "askm_izin_dosen_matkul_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_dosen_matkul", "askm_r_status_request", column: "status_request_dosen_matkul", primary_key: "status_request_id", name: "askm_r_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_dosen_matkul", "hrdx_pegawai", column: "dosen_matkul_id", primary_key: "pegawai_id", name: "askm_izin_dosen_matkul_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "askm_dim_pelanggaran", column: "pelanggaran_id", primary_key: "pelanggaran_id", name: "askm_izin_keluar_ibfk_7", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "askm_r_status_request", column: "status_request_baak", primary_key: "status_request_id", name: "askm_izin_keluar_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "askm_r_status_request", column: "status_request_dosen_matkul", primary_key: "status_request_id", name: "askm_izin_keluar_ibfk_6", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "askm_r_status_request", column: "status_request_dosen_wali", primary_key: "status_request_id", name: "fk_askm_izin_keluar_askm_r_status_request1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "askm_r_status_request", column: "status_request_keasramaan", primary_key: "status_request_id", name: "askm_izin_keluar_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_askm_izin_keluar_dimx_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "hrdx_pegawai", column: "baak_id", primary_key: "pegawai_id", name: "askm_izin_keluar_ibfk_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "hrdx_pegawai", column: "dosen_wali_id", primary_key: "pegawai_id", name: "askm_izin_keluar_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "hrdx_pegawai", column: "keasramaan_id", primary_key: "pegawai_id", name: "askm_izin_keluar_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_keluar", "ubux_r_lokasi_log", column: "lokasi_log_id", primary_key: "lokasi_log_id", name: "fk_askm_izin_keluar_lokasi_log", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_kolaboratif", "askm_r_status_request", column: "status_request_id", primary_key: "status_request_id", name: "fk_askm_izin_tambahan_jam_kolaboratif_askm_r_status_request1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_kolaboratif", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_askm_izin_tambahan_jam_kolaboratif_dimx_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_kolaboratif", "hrdx_pegawai", column: "baak_id", primary_key: "pegawai_id", name: "askm_izin_kolaboratif_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_ruangan", "askm_r_status_request", column: "status_request_id", primary_key: "status_request_id", name: "fk_askm_izin_penggunaan_ruangan_askm_r_status_request1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_ruangan", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_askm_izin_penggunaan_ruangan_dimx_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_ruangan", "hrdx_pegawai", column: "baak_id", primary_key: "pegawai_id", name: "askm_izin_ruangan_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_izin_ruangan", "mref_r_lokasi", column: "lokasi_id", primary_key: "lokasi_id", name: "askm_izin_ruangan_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_kamar", "askm_asrama", column: "asrama_id", primary_key: "asrama_id", name: "fk_askm_kamar_askm_asrama1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_keasramaan", "askm_asrama", column: "asrama_id", primary_key: "asrama_id", name: "askm_keasramaan_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_keasramaan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "askm_keasramaan_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_log_mahasiswa", "askm_dim_pelanggaran", column: "pelanggaran_id", primary_key: "pelanggaran_id", name: "askm_log_mahasiswa_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_log_mahasiswa", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_dim_log_mahasiswa", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_log_mahasiswa", "ubux_r_lokasi_log", column: "lokasi_log_id", primary_key: "lokasi_log_id", name: "fk_lokasi_log_log_mahasiswa", on_update: :cascade, on_delete: :cascade
  add_foreign_key "askm_poin_kebaikan", "askm_dim_pelanggaran", column: "pelanggaran_id", primary_key: "pelanggaran_id", name: "askm_poin_kebaikan_ibfk_1"
  add_foreign_key "askm_poin_kebaikan", "askm_dim_penilaian", column: "penilaian_id", primary_key: "penilaian_id", name: "askm_poin_kebaikan_ibfk_2"
  add_foreign_key "askm_poin_pelanggaran", "askm_bentuk_pelanggaran", column: "bentuk_id", primary_key: "bentuk_id", name: "askm_poin_pelanggaran_ibfk_2"
  add_foreign_key "askm_poin_pelanggaran", "askm_tingkat_pelanggaran", column: "tingkat_id", primary_key: "tingkat_id", name: "askm_poin_pelanggaran_ibfk_1"
  add_foreign_key "attendance_logs", "attendance_sessions"
  add_foreign_key "baak_dim_has_surat_lomba", "baak_surat_lomba", column: "surat_lomba_id", primary_key: "surat_lomba_id", name: "FK_baak_dim_has_surat_lomba", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_lomba", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_baak_dim_has_surat_lomba2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_magang", "baak_surat_magang", column: "surat_magang_id", primary_key: "surat_magang_id", name: "FK_baak_dim_has_surat_magang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_magang", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_baak_dim_has_surat_magang2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_pengantar_proyek", "baak_surat_pengantar_proyek", column: "surat_pengantar_proyek_id", primary_key: "surat_pengantar_proyek_id", name: "FK_baak_dim_has_surat_pengantar_proyek", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_pengantar_proyek", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_baak_dim_has_surat_pengantar_proyek2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_pengantar_ta", "baak_surat_pengantar_ta", column: "surat_pengantar_ta_id", primary_key: "surat_pengantar_ta_id", name: "dim_has_surat_pengantar_ta", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_pengantar_ta", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "dim_has_surat_pengantar_ta_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_permohonan_kp", "baak_surat_permohonan_kp", column: "surat_permohonan_kp_id", primary_key: "surat_permohonan_kp_id", name: "FK_permohonan_kp_has_permohonan_kp", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_dim_has_surat_permohonan_kp", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_dim_has_permohonan_kp", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_kaos_del", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_kaos_del", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_kartu_tanda_mahasiswa", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_baak_kartu_tanda_mahasiswa", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_kartu_tanda_mahasiswa", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_baak_kartu_tanda_mahasiswa2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_kartu_tanda_mahasiswa", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_kartu_tanda_mahasiswa3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_r_nomor_surat_terakhir", "baak_format_nomor_surat", column: "format_nomor_surat_id", primary_key: "format_nomor_surat_id", name: "fk_nomor_surat_terakhir_format_nomor_surat", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_keterangan_lulus", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "baak_surat_keterangan_lulus_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_keterangan_lulus", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "baak_surat_keterangan_lulus_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_keterangan_lulus", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "baak_surat_keterangan_lulus_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_keterangan_lulus", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "baak_surat_keterangan_lulus_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_keterangan_lulus", "inst_struktur_jabatan", column: "penandatangan_id", primary_key: "struktur_jabatan_id", name: "baak_surat_keterangan_lulus_ibfk_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_lomba", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "baak_surat_lomba_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_lomba", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_baak_surat_lomba", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_lomba", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_baak_surat_lomba2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_lomba", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_surat_lomba3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_magang", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "baak_surat_magang_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_magang", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_baak_surat_magang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_magang", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_baak_surat_magang2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_magang", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_surat_magang3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_mahasiswa_aktif", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "baak_surat_mahasiswa_aktif_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_mahasiswa_aktif", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_baak_surat_mahasiswa_aktif", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_mahasiswa_aktif", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_baak_surat_mahasiswa_aktif2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_mahasiswa_aktif", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_surat_mahasiswa_aktif3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_proyek", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "baak_surat_pengantar_proyek_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_proyek", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_baak_surat_pengantar_proyek", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_proyek", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_baak_surat_pengantar_proyek2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_proyek", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_surat_pengantar_proyek3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "FK_baak_surat_pengantar_ta_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_baak_surat_pengantar_ta_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_baak_surat_pengantar_ta", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_baak_surat_pengantar_ta_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta", "inst_pejabat", column: "penandatangan", primary_key: "pejabat_id", name: "FK_baak_surat_pengantar_ta_6", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_baak_surat_pengantar_ta_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_pengantar_ta_has_variabel", "baak_surat_pengantar_ta", column: "surat_pengantar_ta_id", primary_key: "surat_pengantar_ta_id", name: "surat_pengantar_ta_has_variabel", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_permohonan_kp", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "FK_surat_permohonan_kp_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_permohonan_kp", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "FK_surat_permohonan_kp_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_permohonan_kp", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "FK_surat_permohonan_kp", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_permohonan_kp", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_surat_permohonan_kp_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_permohonan_kp", "inst_pejabat", column: "penandatangan", primary_key: "pejabat_id", name: "FK_surat_permohonan_kp_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_rekomendasi_mbkm", "baak_kop_surat", column: "kop_surat_id", primary_key: "kop_surat_id", name: "baak_surat_rekomendasi_mbkm_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_rekomendasi_mbkm", "baak_r_status_pengajuan", column: "status_pengajuan_id", primary_key: "status_pengajuan_id", name: "baak_surat_rekomendasi_mbkm_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_rekomendasi_mbkm", "dimx_dim", column: "pemohon_id", primary_key: "dim_id", name: "baak_surat_rekomendasi_mbkm_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_rekomendasi_mbkm", "hrdx_pegawai", column: "koordinator_id", primary_key: "pegawai_id", name: "baak_surat_rekomendasi_mbkm_ibfk_6", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_rekomendasi_mbkm", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "baak_surat_rekomendasi_mbkm_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "baak_surat_rekomendasi_mbkm", "inst_struktur_jabatan", column: "penandatangan_id", primary_key: "struktur_jabatan_id", name: "baak_surat_rekomendasi_mbkm_ibfk_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_atasan_cuti_nontahunan", "cist_permohonan_cuti_nontahunan", column: "permohonan_cuti_nontahunan_id", primary_key: "permohonan_cuti_nontahunan_id", name: "FK_cist_atasan_cuti_nontahunan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_atasan_cuti_tahunan", "cist_permohonan_cuti_tahunan", column: "permohonan_cuti_tahunan_id", primary_key: "permohonan_cuti_tahunan_id", name: "FK_cist_atasan_cuti_tahunan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_atasan_izin", "cist_permohonan_izin", column: "permohonan_izin_id", primary_key: "permohonan_izin_id", name: "FK_cist_atasan_izin", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_atasan_surat_tugas", "cist_surat_tugas", column: "surat_tugas_id", primary_key: "surat_tugas_id", name: "FK_cist_atasan_surat_tugas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_atasan_surat_tugas", "hrdx_pegawai", column: "id_pegawai", primary_key: "pegawai_id", name: "fk_cist_atasan_hrdx_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_laporan_surat_tugas", "cist_r_status", column: "status_id", primary_key: "status_id", name: "FK_status_laporan_surat_tugas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_laporan_surat_tugas", "cist_surat_tugas", column: "surat_tugas_id", primary_key: "surat_tugas_id", name: "FK_cist_laporan_surat_tugas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_permohonan_cuti_nontahunan", "cist_kategori_cuti_nontahunan", column: "kategori_id", primary_key: "kategori_cuti_nontahunan_id", name: "FK_cist_permohonan_cuti_nontahunan12", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_permohonan_cuti_nontahunan", "cist_status_cuti_nontahunan", column: "status_cuti_nontahunan_id", primary_key: "status_cuti_nontahunan_id", name: "cist_permohonan_cuti_nontahunan_ibfk_12", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_permohonan_cuti_nontahunan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_cist_permohonan_cuti_pegawai12"
  add_foreign_key "cist_permohonan_cuti_tahunan", "cist_status_cuti_tahunan", column: "status_izin_id", primary_key: "status_cuti_tahunan_id", name: "cist_permohonan_cuti_tahunan_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_permohonan_cuti_tahunan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_cist_permohonan_cuti_tahunan"
  add_foreign_key "cist_permohonan_izin", "cist_status_izin", column: "status_izin_id", primary_key: "status_izin_id", name: "cist_permohonan_izin_ibfk_1"
  add_foreign_key "cist_permohonan_izin", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_cist_permohonan_izin"
  add_foreign_key "cist_r_kuota_cuti_tahunan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_cist_kuota_cuti_tahunan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_status_cuti_nontahunan", "cist_r_status", column: "status_by_atasan", primary_key: "status_id", name: "cist_status_cuti_nontahunan_ibfk_2"
  add_foreign_key "cist_status_cuti_nontahunan", "cist_r_status", column: "status_by_hrd", primary_key: "status_id", name: "cist_status_cuti_nontahunan_ibfk_1"
  add_foreign_key "cist_status_cuti_nontahunan", "cist_r_status", column: "status_by_wr2", primary_key: "status_id", name: "cist_status_cuti_nontahunan_ibfk_3"
  add_foreign_key "cist_status_cuti_tahunan", "cist_r_status", column: "status_by_atasan", primary_key: "status_id", name: "cist_status_cuti_tahunan_ibfk_2"
  add_foreign_key "cist_status_cuti_tahunan", "cist_r_status", column: "status_by_hrd", primary_key: "status_id", name: "cist_status_cuti_tahunan_ibfk_1"
  add_foreign_key "cist_status_cuti_tahunan", "cist_r_status", column: "status_by_wr2", primary_key: "status_id", name: "cist_status_cuti_tahunan_ibfk_3"
  add_foreign_key "cist_status_izin", "cist_r_status", column: "status_by_atasan", primary_key: "status_id", name: "cist_status_izin_ibfk_1"
  add_foreign_key "cist_status_izin", "cist_r_status", column: "status_by_hrd", primary_key: "status_id", name: "cist_status_izin_ibfk_3"
  add_foreign_key "cist_status_izin", "cist_r_status", column: "status_by_wr2", primary_key: "status_id", name: "cist_status_izin_ibfk_2"
  add_foreign_key "cist_surat_tugas", "cist_r_jenis_surat", column: "jenis_surat_id", primary_key: "jenis_surat_id", name: "FK_jenis_surat", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_surat_tugas", "cist_r_status", column: "status_id", primary_key: "status_id", name: "FK_cist_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_surat_tugas", "hrdx_pegawai", column: "perequest", primary_key: "pegawai_id", name: "FK_cist_surat_tugas_perequest", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_surat_tugas_assignee", "cist_surat_tugas", column: "surat_tugas_id", primary_key: "surat_tugas_id", name: "FK_surat", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_surat_tugas_assignee", "hrdx_pegawai", column: "id_pegawai", primary_key: "pegawai_id", name: "fk_cist_assignee_hrdx_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_surat_tugas_file", "cist_surat_tugas", column: "surat_tugas_id", primary_key: "surat_tugas_id", name: "FK_cist_surat_tugas_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cist_waktu_cuti_tahunan", "cist_permohonan_cuti_tahunan", column: "permohonan_cuti_tahunan_id", primary_key: "permohonan_cuti_tahunan_id", name: "FK_cist_waktu_cuti_tahunan"
  add_foreign_key "dimx_alumni", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_alumni_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_alumni", "hrdx_dosen", column: "dosen_id_1", primary_key: "dosen_id", name: "FK_dimx_alumni_dosen_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_alumni", "hrdx_dosen", column: "dosen_id_2", primary_key: "dosen_id", name: "FK_dimx_alumni_dosen_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_alumni_data", "dimx_alumni", column: "alumni_id", primary_key: "alumni_id", name: "fk_t_alumni_data_t_alumni1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_alumni_pekerjaan", "dimx_alumni", column: "alumni_id", primary_key: "alumni_id", name: "FK_dimx_alumni_pekerjaan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "inst_prodi", column: "ref_kbk_id", primary_key: "ref_kbk_id", name: "FK_dimx_dim_ref_kbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "krkm_r_tahun_kurikulum", column: "tahun_kurikulum_id", primary_key: "tahun_kurikulum_id", name: "FK_dimx_dim_thn_krkm", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_agama", column: "agama_id", primary_key: "agama_id", name: "FK_dimx_dim_agama", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_asal_sekolah", column: "asal_sekolah_id", primary_key: "asal_sekolah_id", name: "FK_dimx_dim_asal_sekolah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_golongan_darah", column: "golongan_darah_id", primary_key: "golongan_darah_id", name: "FK_dimx_dim_golongan_darah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_jenis_kelamin", column: "jenis_kelamin_id", primary_key: "jenis_kelamin_id", name: "FK_dimx_dim_jenis_kelamin", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_pekerjaan", column: "pekerjaan_ayah_id", primary_key: "pekerjaan_id", name: "FK_dimx_dim_pekerjaan_ayah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_pekerjaan", column: "pekerjaan_ibu_id", primary_key: "pekerjaan_id", name: "FK_dimx_dim_pekerjaan_ibu", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_pekerjaan", column: "pekerjaan_wali_id", primary_key: "pekerjaan_id", name: "FK_dimx_dim_pekerjaan_wali", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_penghasilan", column: "penghasilan_ayah_id", primary_key: "penghasilan_id", name: "FK_dimx_dim_penghasilan_ayah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_penghasilan", column: "penghasilan_ibu_id", primary_key: "penghasilan_id", name: "FK_dimx_dim_penghasilan_ibu", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "mref_r_penghasilan", column: "penghasilan_wali_id", primary_key: "penghasilan_id", name: "FK_dimx_dim_penghasilan_wali_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_dimx_dim_user"
  add_foreign_key "dimx_dim_pmb", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_dim_pmb_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim_pmb_daftar", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_dim_pmb_daftar_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_dim_trnon_lulus", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_dim_trnon_lulus_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "dimx_histori_prodi", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_dimx_histori_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_hrdx_dosen_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "inst_prodi", column: "prodi_id", primary_key: "ref_kbk_id", name: "FK_hrdx_dosen_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "mref_r_gbk", column: "gbk_1", primary_key: "gbk_id", name: "FK_hrdx_dosen_gbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "mref_r_gbk", column: "gbk_2", primary_key: "gbk_id", name: "FK_hrdx_dosen_gbk2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "mref_r_golongan_kepangkatan", column: "golongan_kepangkatan_id", primary_key: "golongan_kepangkatan_id", name: "FK_hrdx_dosen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "mref_r_jabatan_akademik", column: "jabatan_akademik_id", primary_key: "jabatan_akademik_id", name: "FK_hrdx_dosen_jab", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_dosen", "mref_r_status_ikatan_kerja_dosen", column: "status_ikatan_kerja_dosen_id", primary_key: "status_ikatan_kerja_dosen_id", name: "FK_hrdx_dosen_stts", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_karyawan_lapangan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "hrdx_karyawan_lapangan_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_karyawan_lapangan", "hrdx_r_karyawan_lapangan_role", column: "karyawan_lapangan_role_id", primary_key: "karyawan_lapangan_role_id", name: "hrdx_karyawan_lapangan_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "inst_prodi", column: "ref_kbk_id", primary_key: "ref_kbk_id", name: "FK_hrdx_pegawai_kbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_agama", column: "agama_id", primary_key: "agama_id", name: "FK_hrdx_pegawai_agama", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_golongan_darah", column: "golongan_darah_id", primary_key: "golongan_darah_id", name: "FK_hrdx_pegawai_golda", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_jabatan_akademik", column: "jabatan_akademik_id", primary_key: "jabatan_akademik_id", name: "FK_hrdx_pegawai_jabatan_akademik", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_jenis_kelamin", column: "jenis_kelamin_id", primary_key: "jenis_kelamin_id", name: "FK_hrdx_pegawai_JK", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_kabupaten", column: "kabupaten_id", primary_key: "kabupaten_id", name: "FK_hrdx_pegawai_kab", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_status_aktif_pegawai", column: "status_aktif_pegawai_id", primary_key: "status_aktif_pegawai_id", name: "FK_hrdx_pegawai_sts_aktf", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_status_ikatan_kerja_pegawai", column: "status_ikatan_kerja_pegawai_id", primary_key: "status_ikatan_kerja_pegawai_id", name: "FK_hrdx_pegawai_sts_iktn", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "mref_r_status_marital", column: "status_marital_id", primary_key: "status_marital_id", name: "FK_hrdx_pegawai_sts_martl", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pegawai", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_hrdx_pegawai_user"
  add_foreign_key "hrdx_pendidikan", "hrdx_profile", column: "profile_id", primary_key: "profile_id", name: "fk_t_pendidikan_t_profile1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pengajar", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_hrdx_pengajar_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_pengajar", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "fk_t_pengajar_t_kurikulum1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_riwayat_pendidikan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_hrdx_riwayat_pendidikan_new_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_riwayat_pendidikan", "mref_r_jenjang", column: "jenjang_id", primary_key: "jenjang_id", name: "FK_hrdx_riwayat_pendidikan_new_jenjang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_riwayat_pendidikan_old", "hrdx_dosen", column: "dosen_id", primary_key: "dosen_id", name: "FK_hrdx_riwayat_pendidikan_dosen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_riwayat_pendidikan_old", "hrdx_staf", column: "staf_id", primary_key: "staf_id", name: "FK_hrdx_riwayat_pendidikan_staf", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_riwayat_pendidikan_old", "mref_r_jenjang", column: "jenjang_id", primary_key: "jenjang_id", name: "FK_hrdx_riwayat_pendidikan_jenjang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_staf", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_hrdx_staf_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_staf", "hrdx_r_staf_role", column: "staf_role_id", primary_key: "staf_role_id", name: "FK_hrdx_staf_role", on_update: :cascade, on_delete: :cascade
  add_foreign_key "hrdx_staf", "inst_prodi", column: "prodi_id", primary_key: "ref_kbk_id", name: "FK_hrdx_staf_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_pejabat", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_inst_pejabat_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_pejabat", "inst_struktur_jabatan", column: "struktur_jabatan_id", primary_key: "struktur_jabatan_id", name: "FK_pejabat_struktur_jabatan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_prodi", "inst_fakultas", column: "fakultas_id", primary_key: "fakultas_id", name: "fk_inst_fakultas_inst_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_prodi", "inst_r_jenjang", column: "jenjang_id", primary_key: "jenjang_id", name: "FK_krkm_r_kbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_struktur_jabatan", "inst_instansi", column: "instansi_id", primary_key: "instansi_id", name: "FK_struktur_jabatan_instansi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_struktur_jabatan", "inst_struktur_jabatan", column: "parent", primary_key: "struktur_jabatan_id", name: "FK_struktur_jabatan_struktur_jabatan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_struktur_jabatan", "inst_unit", column: "unit_id", primary_key: "unit_id", name: "FK_struktur_jabatan_unit", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_unit", "inst_instansi", column: "instansi_id", primary_key: "instansi_id", name: "FK_unit_instansi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "inst_unit", "inst_struktur_jabatan", column: "kepala", primary_key: "struktur_jabatan_id", name: "FK_unit_struktur_jabatan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_arsip_vendor", "invt_r_vendor", column: "vendor_id", primary_key: "vendor_id", name: "FK_invt_arsip_vendor", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_barang", "invt_r_brand", column: "brand_id", primary_key: "brand_id", name: "FK_invt_barang_brand", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_barang", "invt_r_jenis_barang", column: "jenis_barang_id", primary_key: "jenis_barang_id", name: "FK_invt_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_barang", "invt_r_kategori", column: "kategori_id", primary_key: "kategori_id", name: "FK_invt_barang_kategori", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_barang", "invt_r_satuan", column: "satuan_id", primary_key: "satuan_id", name: "FK_invt_barang_satuan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_barang", "invt_r_unit", column: "unit_id", primary_key: "unit_id", name: "FK_invt_barang_unit", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_barang", "invt_r_vendor", column: "vendor_id", primary_key: "vendor_id", name: "FK_invt_barang_vendor", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_detail_peminjaman_barang", "invt_barang", column: "barang_id", primary_key: "barang_id", name: "FK_invt_detail_peminjaman_barang_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_detail_peminjaman_barang", "invt_peminjaman_barang", column: "peminjaman_barang_id", primary_key: "peminjaman_barang_id", name: "FK_invt_detail_peminjaman_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_file_vendor", "invt_arsip_vendor", column: "arsip_vendor_id", primary_key: "arsip_vendor_id", name: "FK_invt_file_vendor", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pelaporan_barang_rusak", "invt_barang", column: "barang_id", primary_key: "barang_id", name: "FK_invt_barang_rusak", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pelaporan_barang_rusak", "invt_r_unit", column: "unit_id", primary_key: "unit_id", name: "FK_invt_pelaporan_barang_rusak_unit", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pelaporan_barang_rusak", "sysx_user", column: "pelapor", primary_key: "user_id", name: "FK_invt_barang_rusak_pelapor", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pemindahan_barang", "invt_pengeluaran_barang", column: "pengeluaran_barang_id", primary_key: "pengeluaran_barang_id", name: "FK_invt_pemindahan_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_peminjaman_barang", "invt_r_unit", column: "unit_id", primary_key: "unit_id", name: "FK_invt_peminjaman_barang_unit", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_peminjaman_barang", "sysx_user", column: "approved_by", primary_key: "user_id", name: "FK_invt_peminjaman_approved_by", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_peminjaman_barang", "sysx_user", column: "oleh", primary_key: "user_id", name: "FK_invt_peminjaman_oleh", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pengeluaran_barang", "invt_barang", column: "barang_id", primary_key: "barang_id", name: "FK_invt_detail_pengeluaran_barang_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pengeluaran_barang", "invt_keterangan_pengeluaran", column: "keterangan_pengeluaran_id", primary_key: "keterangan_pengeluaran_id", name: "FK_invt_pengeluaran_barang_keterangan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pengeluaran_barang", "invt_r_lokasi", column: "lokasi_id", primary_key: "lokasi_id", name: "FK_invt_pengeluaran_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pengeluaran_barang", "invt_r_status", column: "status_akhir", primary_key: "nama", name: "FK_invt_pengeluaran_barang_STATUS", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pic_barang", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_invt_pic_barang_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pic_barang", "invt_pengeluaran_barang", column: "pengeluaran_barang_id", primary_key: "pengeluaran_barang_id", name: "FK_invt_pic_barang", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_pic_barang_file", "invt_pic_barang", column: "pic_barang_id", primary_key: "pic_barang_id", name: "FK_invt_pic_barang_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_summary_jumlah", "invt_barang", column: "barang_id", primary_key: "barang_id", name: "FK_invt_summary_jumlah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_unit_charged", "invt_r_unit", column: "unit_id", primary_key: "unit_id", name: "FK_invt_unit_user_unit", on_update: :cascade, on_delete: :cascade
  add_foreign_key "invt_unit_charged", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_invt_unit_user_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal", "adak_kelas", column: "kelas_id", primary_key: "kelas_id", name: "kelas_id_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal", "jdwl_jadwal", column: "predecessor", primary_key: "jadwal_id", name: "predeccessor_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal", "jdwl_jadwal", column: "successor", primary_key: "jadwal_id", name: "successor_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "kuliah_id_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal", "mref_r_lokasi", column: "lokasi_id", primary_key: "lokasi_id", name: "lokasi_id_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal_sesi", "jdwl_jadwal", column: "jadwal_id", primary_key: "jadwal_id", name: "jadwal_id_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jdwl_jadwal_sesi", "jdwl_r_sesi", column: "sesi_id", primary_key: "sesi_id", name: "sesi_id_constraint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kmhs_detail_kasus", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_detail_kasus_t_dim1"
  add_foreign_key "kmhs_master_kasus", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_master_kasus_t_dim1"
  add_foreign_key "kmhs_nilai_perilaku", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_perilaku_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kmhs_nilai_perilaku", "kmhs_r_kriteria_nilai_perilaku", column: "kriteria_nilai_perilaku_id", primary_key: "kriteria_nilai_perilaku_id", name: "fk_t_nilai_perilaku_t_kriteria_nilai_perilaku1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kmhs_nilai_perilaku_arsip", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_perilaku_arsip_t_dim1"
  add_foreign_key "kmhs_nilai_perilaku_arsip", "kmhs_r_kriteria_nilai_perilaku", column: "kriteria_nilai_perilaku_id", primary_key: "kriteria_nilai_perilaku_id", name: "fk_t_nilai_perilaku_arsip_t_kriteria_nilai_perilaku1"
  add_foreign_key "kmhs_nilai_perilaku_as", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_perilaku_as_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kmhs_nilai_perilaku_summary", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_perilaku_summary_t_dim1"
  add_foreign_key "kmhs_nilai_perilaku_ts", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_perilaku_ts_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_buku", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_buku_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_komponen", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_komponen_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_komponen", "kolb_buku", column: "buku_id", primary_key: "buku_id", name: "fk_komponen_buku", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_komponen", "kolb_komponen", column: "parent", primary_key: "komponen_id", name: "fk_komponen_komponen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_komponen", "kolb_r_status", column: "status_id", primary_key: "status_id", name: "fk_komponen_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_lampiran", "kolb_komponen", column: "komponen_id", primary_key: "komponen_id", name: "fk_lampiran_komponen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_lampiran", "kolb_r_kategori_lampiran", column: "kategori_lampiran_id", primary_key: "kategori_lampiran_id", name: "fk_lampiran_kategori_lampiran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_penilai", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "kolb_penilai_pegawai_fk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_penilai", "kolb_komponen", column: "komponen_id", primary_key: "komponen_id", name: "kolb_penilai_komponen_fk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_penulis", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_penulis_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kolb_penulis", "kolb_komponen", column: "komponen_id", primary_key: "komponen_id", name: "fk_penulis_komponen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kuliah", "inst_prodi", column: "ref_kbk_id", primary_key: "ref_kbk_id", name: "fk_t_kurikulum_t_ref_kbk2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kuliah", "krkm_course_group", column: "course_group_id", primary_key: "course_group_id", name: "FK_krkm_kurikulum_cg", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kuliah", "krkm_r_tahun_kurikulum", column: "tahun_kurikulum_id", primary_key: "tahun_kurikulum_id", name: "FK_krkm_kurikulum", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kuliah_ekivalen", "krkm_kuliah", column: "mk_asal", primary_key: "kuliah_id", name: "krkm_kuliah_ekivalen_ibfk_1"
  add_foreign_key "krkm_kuliah_ekivalen", "krkm_kuliah", column: "mk_tujuan", primary_key: "kuliah_id", name: "krkm_kuliah_ekivalen_ibfk_2"
  add_foreign_key "krkm_kuliah_prodi", "inst_prodi", column: "ref_kbk_id", primary_key: "ref_kbk_id", name: "FK_krkm_kuliah_prodi_ref_kbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kuliah_prodi", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_krkm_kuliah_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kurikulum_prodi", "inst_prodi", column: "ref_kbk_id", primary_key: "ref_kbk_id", name: "fk_t_kurikulum_prodi_t_ref_kbk1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_kurikulum_prodi", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "fk_t_kurikulum_prodi_t_kurikulum1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_prerequisite_courses", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_krkm_prerequisite_courses_kuri", on_update: :cascade, on_delete: :cascade
  add_foreign_key "krkm_prerequisite_courses", "krkm_kuliah", column: "kuliah_pre_id", primary_key: "kuliah_id", name: "FK_krkm_prerequisite_courses_kuri_pre", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_alat", "labx_lab", column: "lab_id", primary_key: "lab_id", name: "fk_lab", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_alat", "labx_lemari", column: "lemari_id", primary_key: "lemari_id", name: "fk_lemari", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_alat_rusak", "labx_alat", column: "alat_id", primary_key: "alat_id", name: "fk_alat_id_rusak", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_alat_rusak", "labx_peminjaman", column: "peminjaman_id", primary_key: "peminjaman_id", name: "fk_peminjaman_id_rusak", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_bahan", "labx_lab", column: "lab_id", primary_key: "lab_id", name: "fk_lab_bahan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_bahan", "labx_lemari", column: "lemari_id", primary_key: "lemari_id", name: "fk_lemari_bahan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_bahan", "labx_satuan", column: "satuan_id", primary_key: "satuan_id", name: "fk_satuan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_item_pemesanan", "labx_bahan", column: "bahan_id", primary_key: "bahan_id", name: "fk_bahan_oesan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_item_pemesanan", "labx_pemesanan", column: "pemesanan_id", primary_key: "pemesanan_id", name: "fk_pemesanan_bahan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_item_pemesanan", "labx_r_status", column: "status_id", primary_key: "status_id", name: "fk_item_pemesanan_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_item_peminjaman", "labx_alat", column: "alat_id", primary_key: "alat_id", name: "fk_item_alat", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_item_peminjaman", "labx_peminjaman", column: "peminjaman_id", primary_key: "peminjaman_id", name: "fk_item_peminjaman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_item_peminjaman", "labx_r_status", column: "status_id", primary_key: "status_id", name: "fk_item_peminjaman_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_dim_pemesanan2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_pegawai_pemesanan3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "fk_kuliah3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "labx_r_status", column: "status_id", primary_key: "status_id", name: "fk_status3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "labx_r_tujuan", column: "tujuan_id", primary_key: "tujuan_id", name: "fk_tujuan3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_pemesan3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_pemesanan", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_pemesan_bahan3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_peminjaman", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_dim_peminjaman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_peminjaman", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_pegawai_peminjaman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_peminjaman", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "fk_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_peminjaman", "labx_r_status", column: "status_id", primary_key: "status_id", name: "fk_status_peminjaman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_peminjaman", "labx_r_tujuan", column: "tujuan_id", primary_key: "tujuan_id", name: "fk_tujuan_peminjaman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_peminjaman", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_peminjam_alat", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_alat", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_pegawai4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_alat", "labx_alat", column: "alat_id", primary_key: "alat_id", name: "alatfk23", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_alat", "labx_r_status", column: "status_id", primary_key: "status_id", name: "statusfk4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_alat", "sysx_user", column: "user_id", primary_key: "user_id", name: "userfk4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_bahan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_pegawai25", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_bahan", "labx_bahan", column: "bahan_id", primary_key: "bahan_id", name: "bahanfk25", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_bahan", "labx_r_status", column: "status_id", primary_key: "status_id", name: "statusfk25", on_update: :cascade, on_delete: :cascade
  add_foreign_key "labx_penambahan_stok_bahan", "sysx_user", column: "user_id", primary_key: "user_id", name: "userfk25", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_penelitian_dosen", "hrdx_dosen", column: "dosen_id", primary_key: "dosen_id", name: "lppm_penelitian_dosen_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_penelitian_dosen", "lppm_penelitian", column: "penelitian_id", primary_key: "penelitian_id", name: "lppm_penelitian_dosen_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_r_subkaryailmiah", "lppm_r_karyailmiah", column: "karyailmiah_id", primary_key: "karyailmiah_id", name: "FK_lppm_r_subkaryailmiah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_author_publikasi", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_author_publikasi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_ketua_gbk", "hrdx_dosen", column: "dosen_id", primary_key: "dosen_id", name: "FK_lppm_t_ketua_gbk_dosen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_ketua_gbk", "mref_r_gbk", column: "gbk_id", primary_key: "gbk_id", name: "FK_lppm_t_ketua_gbk_gbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_logreview", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_lppm_t_logreview_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_logreview", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_logreview_publikasi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_publikasi", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_lppm_t_publikasi_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_publikasi", "lppm_r_subkaryailmiah", column: "subkaryailmiah_id", primary_key: "subkaryailmiah_id", name: "FK_lppm_t_publikasi_sub_karya_ilmiah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_publikasi", "mref_r_gbk", column: "gbk_id", primary_key: "gbk_id", name: "FK_lppm_t_publikasi_gbk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_registrasi_file", "lppm_t_registrasipublikasi", column: "registrasipublikasi_id", primary_key: "registrasipublikasi_id", name: "FK_lppm_t_registrasi_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_registrasi_jurnal", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_registrasi_jurnal", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_registrasi_jurnal_file", "lppm_t_registrasi_jurnal", column: "registrasi_jurnal_id", primary_key: "registrasi_jurnal_id", name: "FK_lppm_t_registrasi_jurnal_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_registrasi_prosiding", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_registrasi_prosiding", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_registrasi_prosiding_file", "lppm_t_registrasi_prosiding", column: "registrasi_prosiding_id", primary_key: "registrasi_prosiding_id", name: "FK_lppm_t_registrasi_prosiding_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_registrasipublikasi", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_registrasipublikasi_publikasi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_review_file", "lppm_t_logreview", column: "logreview_id", primary_key: "logreview_id", name: "FK_lppm_t_review_file_log_review", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_reward_file", "lppm_t_rewardpublikasi", column: "rewardpublikasi_id", primary_key: "rewardpublikasi_id", name: "FK_lppm_t_reward_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_reward_jurnal", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_reward_jurnal", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_reward_jurnal_file", "lppm_t_reward_jurnal", column: "reward_jurnal_id", primary_key: "reward_jurnal_id", name: "FK_lppm_t_reward_jurnal_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_reward_prosiding", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_reward_prosiding", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_reward_prosiding_file", "lppm_t_reward_prosiding", column: "reward_prosiding_id", primary_key: "reward_prosiding_id", name: "FK_lppm_t_reward_prosiding_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lppm_t_rewardpublikasi", "lppm_t_publikasi", column: "publikasi_id", primary_key: "publikasi_id", name: "FK_lppm_t_rewardpublikasi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "mref_r_asal_sekolah", "mref_r_kabupaten", column: "kabupaten_id", primary_key: "kabupaten_id", name: "FK_mref_r_asal_sekolah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "mref_r_asal_sekolah", "mref_r_provinsi", column: "provinsi_id", primary_key: "provinsi_id", name: "FK_mref_r_asal_sekolah_provinsi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_ext_mhs", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_nlai_ext_mhs_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_ext_mhs", "nlai_r_ext", column: "ext_id", primary_key: "ext_id", name: "FK_nlai_ext_mhs", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_kompetensi_mbkm", "prkl_krs_detail", column: "krs_detail_id", primary_key: "krs_detail_id", name: "krs_kompetensi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_komponen_tambahan", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_komponen_tambahan_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_komposisi_nilai", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_komposisi_nilai_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_komposisi_nilai_uts_uas", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_komposisi_nilai_uts_uas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_komponen_tambahan", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_nlai_nilai_komponen_tambahan-dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_komponen_tambahan", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai_komponen_tambahan_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_praktikum", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_praktikum_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_praktikum", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai_praktikum_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_quis", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_quis_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_quis", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai_quis_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_tugas", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_tugas_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_tugas", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai_tugas_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_uas", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_uas_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_uas", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai_uas_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_uts", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_nilai_uts_t_dim1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_nilai_uts", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_nilai_uts_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_rentang_nilai", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_rentang_nilai_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_uas_detail", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_nlai_uas_detail_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_uas_detail", "nlai_komposisi_nilai_uts_uas", column: "komposisi_nilai_uts_uas_id", primary_key: "komposisi_nilai_uts_uas_id", name: "FK_nlai_uas_detail_komposisi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_uas_detail", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_uas_detail", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_unapprove_nilai", "hrdx_pegawai", column: "confirmed_by", primary_key: "pegawai_id", name: "nlai_unapprove_nilai_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_unapprove_nilai", "hrdx_pegawai", column: "pemohon_id", primary_key: "pegawai_id", name: "nlai_unapprove_nilai_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_unapprove_nilai", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "nlai_unapprove_nilai_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_uts_detail", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_nlai_uts_detail_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_uts_detail", "nlai_komposisi_nilai_uts_uas", column: "komposisi_nilai_uts_uas_id", primary_key: "komposisi_nilai_uts_uas_id", name: "FK_nlai_uts_detail_komposisi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "nlai_uts_detail", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_nlai_uts_detail", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_berita_acara_daftar_hadir", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_t_berita_acara_daftar_hadir_t_dim1"
  add_foreign_key "prkl_berita_acara_daftar_hadir", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "fk_t_berita_acara_daftar_hadir_t_kurikulum1"
  add_foreign_key "prkl_berita_acara_kuliah", "adak_kelas", column: "kelas_id", primary_key: "kelas_id", name: "FK_t_berita_acara_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_berita_acara_kuliah", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "fk_t_berita_acara_kuliah_t_kurikulum1"
  add_foreign_key "prkl_course_unit", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_prkl_course_unit_pic", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_course_unit", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_course_unit_kurikulum_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_course_unit_material", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "fk_t_course_unit_material_t_kurikulum1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_course_unit_material", "prkl_material", column: "material_id", primary_key: "material_id", name: "fk_t_course_unit_material_t_material1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_file", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_file_kuri_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_file_materi", "prkl_materi", column: "materi_id", primary_key: "materi_id", name: "FK_prkl_file_materi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_file_praktikum", "prkl_praktikum", column: "praktikum_id", primary_key: "praktikum_id", name: "FK_prkl_file_praktikum", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_file_syllabus", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_file_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_group_kuliah", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_group_kuliah_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_info_ta", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_prkl_info_ta_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_info_ta", "hrdx_dosen", column: "pembimbing_1", primary_key: "dosen_id", name: "FK_prkl_info_ta_pembimbing1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_info_ta", "hrdx_dosen", column: "pembimbing_2", primary_key: "dosen_id", name: "FK_prkl_info_ta_pembimbing2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_detail", "adak_pengajaran", column: "pengajaran_id", primary_key: "pengajaran_id", name: "FK_prkl_krs_detail_pengajaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_detail", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_prkl_krs_detail_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_detail", "prkl_krs_mhs", column: "krs_mhs_id", primary_key: "krs_mhs_id", name: "FK_prkl_krs_detail", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_khusus", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_prkl_krs_khusus_dimx_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_mhs", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_prkl_krs_mhs-dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_mhs", "hrdx_pegawai", column: "approved_by", primary_key: "pegawai_id", name: "FK_prkl_krs_mhs_pegawai_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_mhs", "krkm_r_tahun_kurikulum", column: "tahun_kurikulum_id", primary_key: "tahun_kurikulum_id", name: "FK_prkl_krs_mhs_ta_kur", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_review", "prkl_krs_mhs", column: "krs_mhs_id", primary_key: "krs_mhs_id", name: "FK_prkl_krs_review", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_krs_review", "sysx_user", column: "comment_by", primary_key: "user_id", name: "FK_prkl_krs_review_dosen", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_kuesioner_materi", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "FK_t_kuesioner_materi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_kuesioner_praktikum", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_t_kuesioner_praktikum", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_kurikulum_syllabus", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_prkl_kurikulum_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_kurikulum_syllabus", "mref_r_ta", column: "ta_id", primary_key: "ta_id", name: "FK_prkl_kurikulum_syllabus_ta", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_kurikulum_syllabus_file", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_kurikulum_syllabus_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_materi", "prkl_group_kuliah", column: "group_kuliah_id", primary_key: "group_kuliah_id", name: "FK_prkl_materi_group_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_materi", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_materi_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_material", "prkl_material_kategori", column: "material_kategori_id", primary_key: "material_kategori_id", name: "fk_t_material_t_material_kategori1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_modul_report", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "fk_kuliah_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_modul_report", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "fk_kurikulum_syllabus_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_penilaian_materi", "prkl_kuesioner_materi", column: "kuesioner_materi_id", primary_key: "kuesioner_materi_id", name: "fk_t_penilaian_materi_t_kuesioner_materi1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_penilaian_praktikum", "prkl_kuesioner_praktikum", column: "kuesioner_praktikum_id", primary_key: "kuesioner_praktikum_id", name: "fk_t_penilaian_praktikum_t_kuesioner_praktikum1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_penilaian_tim_pengajar", "hrdx_profile", column: "profile_id", primary_key: "profile_id", name: "FK_prkl_penilaian_tim_pengajar_profile", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_praktikum", "prkl_group_kuliah", column: "group_kuliah_id", primary_key: "group_kuliah_id", name: "FK_prkl_praktikum_group_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_praktikum", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_praktikum_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "prkl_rpp", "prkl_kurikulum_syllabus", column: "kurikulum_syllabus_id", primary_key: "kurikulum_syllabus_id", name: "FK_prkl_rpp_kurikulum_syllabus", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_detil_program", "rakx_program", column: "program_id", primary_key: "program_id", name: "fk_detil_program_program", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_mata_anggaran", "rakx_r_standar", column: "standar_id", primary_key: "standar_id", name: "fk_mata_anggaran_standar", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "inst_pejabat", column: "direvisi_oleh", primary_key: "pejabat_id", name: "fk_program_direvisi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "inst_pejabat", column: "disetujui_oleh", primary_key: "pejabat_id", name: "fk_program_disetujui", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "inst_pejabat", column: "ditolak_oleh", primary_key: "pejabat_id", name: "fk_program_ditolak", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "inst_pejabat", column: "diusulkan_oleh", primary_key: "pejabat_id", name: "fk_program_diusulkan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "inst_struktur_jabatan", column: "dilaksanakan_oleh", primary_key: "struktur_jabatan_id", name: "fk_program_dilaksanakan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "rakx_r_rencana_strategis", column: "rencana_strategis_id", primary_key: "rencana_strategis_id", name: "fk_program_rencana_strategis", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "rakx_r_satuan", column: "satuan_id", primary_key: "satuan_id", name: "fk_program_satuan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "rakx_r_status_program", column: "status_program_id", primary_key: "status_program_id", name: "fk_program_status_program", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program", "rakx_struktur_jabatan_has_mata_anggaran", column: "struktur_jabatan_has_mata_anggaran_id", primary_key: "struktur_jabatan_has_mata_anggaran_id", name: "fk_program_struktur_jabatan_has_mata_anggaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program_has_sumber_dana", "rakx_program", column: "program_id", primary_key: "program_id", name: "fk_program_has_sumber_dana_program", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program_has_sumber_dana", "rakx_r_sumber_dana", column: "sumber_dana_id", primary_key: "sumber_dana_id", name: "fk_program_has_sumber_dana_sumber_dana", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program_has_waktu", "rakx_program", column: "program_id", primary_key: "program_id", name: "fk_program_has_waktu_program", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_program_has_waktu", "rakx_r_bulan", column: "bulan_id", primary_key: "bulan_id", name: "fk_program_has_waktu_bulan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_review_program", "inst_pejabat", column: "pejabat_id", primary_key: "pejabat_id", name: "fk_review_anggaran_pejabat", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_review_program", "rakx_program", column: "program_id", primary_key: "program_id", name: "fk_review_anggaran_program", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_struktur_jabatan_has_mata_anggaran", "inst_struktur_jabatan", column: "struktur_jabatan_id", primary_key: "struktur_jabatan_id", name: "fk_struktur_jabatan_has_mata_anggaran_struktur_jabatan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_struktur_jabatan_has_mata_anggaran", "rakx_mata_anggaran", column: "mata_anggaran_id", primary_key: "mata_anggaran_id", name: "fk_struktur_jabatan_has_mata_anggaran_mata_anggaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rakx_struktur_jabatan_has_mata_anggaran", "rakx_r_tahun_anggaran", column: "tahun_anggaran_id", primary_key: "tahun_anggaran_id", name: "fk_struktur_jabatan_has_mata_anggaran_tahun_anggaran", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_complaint", "rprt_r_bagian", column: "bagian_id", primary_key: "bagian_id", name: "FK_rprt_complaint_bagian", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_complaint", "rprt_r_status", column: "status_id", primary_key: "status_id", name: "FK_rprt_complaint_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_complaint", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_rprt_complaint_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_response", "rprt_complaint", column: "complaint_id", primary_key: "complaint_id", name: "FK_rprt_response_complaint", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_response", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_rprt_response_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_user_has_bagian", "rprt_r_bagian", column: "bagian_id", primary_key: "bagian_id", name: "FK_rprt_user_has_bagian_bagian", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rprt_user_has_bagian", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_rprt_user_has_bagian_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_event", "invt_r_lokasi", column: "lokasi_id", primary_key: "lokasi_id", name: "FK_schd_event", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_event", "schd_r_calender", column: "calender_id", primary_key: "calender_id", name: "FK_schd_event_calender", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_event_invitee", "schd_event", column: "event_id", primary_key: "event_id", name: "FK_schd_event_invitee", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_event_invitee", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_schd_event_invitee-user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_file_event", "schd_event", column: "event_id", primary_key: "event_id", name: "FK_schd_file_event_file", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_jadwal_kuliah", "adak_kelas", column: "kelas_id", primary_key: "kelas_id", name: "FK_schd_jadwal_kuliah_kelas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_jadwal_kuliah", "krkm_kuliah", column: "kuliah_id", primary_key: "kuliah_id", name: "FK_schd_jadwal_kuliah_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_jadwal_kuliah", "schd_event", column: "event_id", primary_key: "event_id", name: "FK_schd_jadwal_kuliah", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_komsumsi", "schd_schedule", column: "schedule_id", primary_key: "schedule_id", name: "schedule_komsumsi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_schedule_permohonan", "rprt_r_bagian", column: "bagian_id", primary_key: "bagian_id", name: "bagian", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_schedule_permohonan", "schd_schedule", column: "schedule_id", primary_key: "schedule_id", name: "schedule", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_schedule_unit", "schd_schedule", column: "schedule_id", primary_key: "schedule_id", name: "schedule_unit_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "schd_subscriber", "schd_r_calender", column: "calender_id", primary_key: "calender_id", name: "FK_schd_subscriber", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_bukti_file", "skkm_daftar_kegiatan_mahasiswa", column: "daftar_kegiatan_id", primary_key: "daftar_kegiatan_id", name: "FK_daftar_bukti", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_daftar_kegiatan_mahasiswa", "hrdx_pegawai", column: "verifikator", primary_key: "pegawai_id", name: "verifikator_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_daftar_kegiatan_mahasiswa", "skkm_indeks_kegiatan", column: "indeks_kegiatan_id", primary_key: "indeks_kegiatan_id", name: "id_indeks", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_daftar_kegiatan_mahasiswa", "skkm_poin_mahasiswa", column: "poin_mahasiswa_id", primary_key: "poin_mahasiswa_id", name: "skkm_daftar_kegiatan_mahasiswa_poin_mahasiswa", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_daftar_kegiatan_mahasiswa", "skkm_r_status", column: "status_id", primary_key: "status_id", name: "skkm_status_daftar_kegiatan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_indeks_kegiatan", "skkm_indeks_kegiatan", column: "parent", primary_key: "indeks_kegiatan_id", name: "skkm_parent_indeks_kegiatan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_poin_mahasiswa", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "skkm_poin_mahasiswa_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skkm_r_poin_prodi_min", "inst_prodi", column: "prodi_id", primary_key: "ref_kbk_id", name: "skkm_poin_prodi_min_inst_prodi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_biaya_perjalanan", "cist_surat_tugas_assignee", column: "surat_tugas_assignee_id", primary_key: "surat_tugas_assignee_id", name: "FK_sppd_biaya_perjalanan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_biaya_perjalanan_supir", "ubux_laporan_pemakaian_kendaraan", column: "laporan_pemakaian_kendaraan_id", primary_key: "laporan_pemakaian_kendaraan_id", name: "FK_sppd_biaya_perjalanan_supir", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_daftar_biaya", "sppd_biaya_perjalanan", column: "biaya_perjalanan_id", primary_key: "biaya_perjalanan_id", name: "FK_biaya_perjalanan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_daftar_biaya", "sppd_standar_biaya", column: "standar_biaya_id", primary_key: "standar_biaya_id", name: "FK_sppd_daftar_biaya", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_daftar_biaya_supir", "sppd_biaya_perjalanan_supir", column: "biaya_perjalanan_supir_id", primary_key: "biaya_perjalanan_supir_id", name: "FK_sppd_daftar_biaya_supir_bp", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_daftar_biaya_supir", "sppd_standar_biaya_supir", column: "standar_biaya_supir_id", primary_key: "standar_biaya_supir_id", name: "FK_sppd_daftar_biaya_supir", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_standar_biaya", "sppd_kategori_biaya", column: "kategori_biaya_id", primary_key: "kategori_biaya_id", name: "FK_kategori_biaya", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sppd_standar_biaya_supir", "sppd_kategori_biaya_supir", column: "kategori_biaya_supir_id", primary_key: "kategori_biaya_supir_id", name: "FK_sppd_standar_biaya_supir", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_kuesioner", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "srvy_kuesioner_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_kuesioner_jawaban_peserta", "srvy_kuesioner", column: "kuesioner_id", primary_key: "kuesioner_id", name: "FK_srvy_kuesioner_jawaban_peserta_kuesioner", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_kuesioner_jawaban_peserta", "srvy_kuesioner_pertanyaan", column: "kuesioner_pertanyaan_id", primary_key: "kuesioner_pertanyaan_id", name: "FK_srvy_kuesioner_jawaban_peserta", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_kuesioner_jawaban_peserta", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_srvy_kuesioner_jawaban_peserta_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_kuesioner_opsi", "srvy_kuesioner_pertanyaan", column: "kuesioner_pertanyaan_id", primary_key: "kuesioner_pertanyaan_id", name: "FK_srvy_kuesioner_opsi_pertanyaan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_kuesioner_pertanyaan", "srvy_kuesioner", column: "kuesioner_id", primary_key: "kuesioner_id", name: "fk_t_kuesioner_pertanyaan_t_kuesioner1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_pollopsi", "srvy_polling", column: "polling_id", primary_key: "polling_id", name: "fk_t_POLLOPSI_t_POLLING1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_pollvote", "srvy_polling", column: "polling_id", primary_key: "polling_id", name: "FK_srvy_pollvote_polling_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_pollvote", "srvy_pollopsi", column: "pollopsi_id", primary_key: "pollopsi_id", name: "FK_t_pollvote", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_workgroup_kuesioner", "srvy_kuesioner", column: "kuesioner_id", primary_key: "kuesioner_id", name: "FK_srvy_workgroup_kuesioner_kuesioner", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_workgroup_kuesioner", "sysx_workgroup", column: "workgroup_id", primary_key: "workgroup_id", name: "FK_srvy_workgroup_kuesioner_wg", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_workgroup_polling", "srvy_polling", column: "polling_id", primary_key: "polling_id", name: "FK_srvy_workgroup_polling_poll", on_update: :cascade, on_delete: :cascade
  add_foreign_key "srvy_workgroup_polling", "sysx_workgroup", column: "workgroup_id", primary_key: "workgroup_id", name: "FK_srvy_workgroup_polling_wk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_action", "sysx_controller", column: "controller_id", primary_key: "controller_id", name: "fk_action_controller1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_config_backup", "sysx_application", column: "application_id", primary_key: "application_id", name: "fk_config_application1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_controller", "sysx_module", column: "module_id", primary_key: "module_id", name: "fk_controller_module1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_job_allocation", "sysx_job_definition", column: "job_definition_id", primary_key: "job_definition_id", name: "fk_job_allocation_job_definition1", on_delete: :cascade
  add_foreign_key "sysx_log", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_Log_user1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_menu_item", "sysx_menu_group", column: "menu_group_id", primary_key: "menu_group_id", name: "fk_menu_item_menu_group1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_module", "sysx_application", column: "application_id", primary_key: "application_id", name: "fk_module_application1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_permission", "sysx_action", column: "action_id", primary_key: "action_id", name: "fk_permission_action1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_action", "sysx_action", column: "action_id", primary_key: "action_id", name: "fk_role_has_action_action1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_action", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_role_has_action_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_application", "sysx_application", column: "application_id", primary_key: "application_id", name: "fk_role_has_application_application1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_application", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_role_has_application_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_controller", "sysx_controller", column: "controller_id", primary_key: "controller_id", name: "fk_role_has_controller_controller1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_controller", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_role_has_controller_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_menu_item", "sysx_menu_item", column: "menu_item_id", primary_key: "menu_item_id", name: "fk_menu_item_has_role_menu_item1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_menu_item", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_menu_item_has_role_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_module", "sysx_module", column: "module_id", primary_key: "module_id", name: "fk_role_has_module_module1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_module", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_role_has_module_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_permission", "sysx_permission", column: "permission_id", primary_key: "permission_id", name: "fk_role_has_permission_permission2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_permission", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_role_has_permission_role2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_task", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_role_has_permission_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_role_has_task", "sysx_task", column: "task_id", primary_key: "task_id", name: "fk_role_has_permission_permission1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_telkom_sso_user", "sysx_user", column: "user_id", primary_key: "user_id", name: "FK_sysx_telkom_sso_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_telkom_sso_user_log", "sysx_telkom_sso_user", column: "telkom_sso_user_id", primary_key: "telkom_sso_user_id", name: "FK_sysx_telkom_sso_user_log", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_user", "sysx_authentication_method", column: "authentication_method_id", primary_key: "authentication_method_id", name: "fk_user_authentication_method1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_user", "sysx_profile", column: "profile_id", primary_key: "profile_id", name: "fk_user_profile1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_user_config", "sysx_application", column: "application_id", primary_key: "application_id", name: "fk_sysx_user_config_sysx_application1"
  add_foreign_key "sysx_user_config", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_sysx_user_config_sysx_user1"
  add_foreign_key "sysx_user_has_role", "sysx_role", column: "role_id", primary_key: "role_id", name: "fk_user_has_role_role1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_user_has_role", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_user_has_role_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "sysx_user_has_workgroup", "sysx_user", column: "user_id", primary_key: "user_id", name: "fk_user_has_workgroup_user1", on_delete: :cascade
  add_foreign_key "sysx_user_has_workgroup", "sysx_workgroup", column: "workgroup_id", primary_key: "workgroup_id", name: "fk_user_has_workgroup_workgroup1", on_delete: :cascade
  add_foreign_key "tmbh_booking", "schd_schedule", column: "schedule_id", primary_key: "schedule_id", name: "tmbh_booking_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tmbh_file_pengumuman", "tmbh_pengumuman", column: "pengumuman_id", primary_key: "pengumuman_id", name: "FK_tmbh_file_pengumuman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tmbh_news", "tmbh_news_kategori", column: "news_kategori_id", primary_key: "news_kategori_id", name: "fk_t_NEWS_t_NEWS_KATEGORI1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tmbh_pengumuman", "sysx_user", column: "owner", primary_key: "user_id", name: "FK_tmbh_pengumuman", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tmbh_software_tools", "krkm_kuliah", column: "kurikulum_id", primary_key: "kuliah_id", name: "fk_t_software_tools_t_kurikulum1"
  add_foreign_key "ubux_data_paket", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "fk_dim", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_data_paket", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "fk_pegawai", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_data_paket", "ubux_r_posisi_paket", column: "posisi_paket_id", primary_key: "posisi_paket_id", name: "fk_posisi", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_data_paket", "ubux_r_status_paket", column: "status_paket_id", primary_key: "status_paket_id", name: "fk_status", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_laporan_pemakaian_kendaraan", "ubux_kendaraan", column: "kendaraan_id", primary_key: "kendaraan_id", name: "ubux_kendaraan_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_laporan_pemakaian_kendaraan", "ubux_pemakaian_kendaraan", column: "pemakaian_kendaraan_id", primary_key: "pemakaian_kendaraan_id", name: "ubux_pemakaian_kendaraaan_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_laporan_pemakaian_kendaraan", "ubux_supir", column: "supir_id", primary_key: "supir_id", name: "ubux_supir_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_pegawai_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan", "ubux_kendaraan", column: "kendaraan_id", primary_key: "kendaraan_id", name: "ubux_transaksi_kendaraan_mahasiswa_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan", "ubux_pemakaian_kendaraan_mhs", column: "pemakaian_kendaraan_mhs_id", primary_key: "pemakaian_kendaraan_mhs_id", name: "ubux_permintaan_kendaraan_mahasiswa", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan", "ubux_r_jenis_keperluan", column: "jenis_keperluan_id", primary_key: "jenis_keperluan_id", name: "FK_jenis_keperluan", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan", "ubux_supir", column: "supir_id", primary_key: "supir_id", name: "ubux_supir_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan_mhs", "dimx_dim", column: "dim_id", primary_key: "dim_id", name: "FK_dimx_dim_constrain", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan_mhs", "ubux_r_status_request", column: "status_req_sekretaris_rektorat", primary_key: "status_request_id", name: "FK_ubux_referensi_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_pemakaian_kendaraan_mhs", "ubux_r_status_request", column: "status_request_kemahasiswaan", primary_key: "status_request_id", name: "FK_ubux_referensi_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ubux_supir", "hrdx_pegawai", column: "pegawai_id", primary_key: "pegawai_id", name: "FK_hrdx_pegawai_constrain", on_update: :cascade, on_delete: :cascade
end

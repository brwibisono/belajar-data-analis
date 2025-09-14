# SQL Learning Journey by brwibisono
# folder week1_sql
# 


## 1_basic
- basic1: Nama produk dan jumlah
- basic2: Data order harga kurang dari 100
- basic3: Data dengan urutan harga termurah


## 2_agregasi
- agregasi1: Hitung total produk terjual
- agregasi2: Cari harga termurah
- agregasi3: Hitung rata-rata harga produk
- agregasi4: Hitung total revenue (qty * price) setiap pelanggan, tampilkan hanya id pelanggan dan total revenue urutan dari terbesar


## 3_join
- join1: Tampilkan order id, nama pelanggan dan produk. INNER JOIN
- join2: Tampilkan order id, nama pelanggan dan produk. LEFT JOIN
- join3: Tampilkan order id, nama pelanggan dan produk. RIGHT JOIN
- join4: Tampilkan order id, nama pelanggan dan produk. FULL JOIN


### TEST and EVALUATION for BASIC, AGGREGATE and JOIN ####
Dataset: Memakai dataset public The Look Ecommerce pada BigQuery
Notes: Materi selanjutnya akan memakai dataset public BigQuery


## 5_subquery
- subquery_select: nama barang, harga retail dan harga rata2
- subquery_where:  nama barang, harga retail 
- subquery_select_where: nama barang, harga retail lebih besar dr harga rata2 keseluruhan
- subquery_from: nama product dan total revenue
- subquery_from_1: nama product, total revenue dan rata2
- quiz_subquery: Tampilkan revenue lebih besar dari rata2 revenue semua produk


## 6_cte (Common Table Expressions)
- cte_double: Buat dua CTE
- cte_storytelling: Evaluate dari materi sebelumnya dikombinasikan dengan cte agar mendapatkan tabel yang bisa untuk di visualisasikan (mini project)


### EVALUASI MATERI MINGGUAN ###
Sadat bahwa materi belajar tidak terstruktur, terlalu mengikuti logic dan kebutuhan pasar. Sampai ada beberapa materi terlewat. Akhir pekan 12/09/2025 - 14/09/2025 alam saya gunakan untuk materi yang terlewat, sebelum memasuki minggu Evaluasi.


## 7_disctinc
- distinct1: Lihat isi dalam kolom category


## 8_null
- null1 - null2: Hitung order tanpa user_id
- nullcoalesce2: Tampilkan gender, jika NULL tulis unknown.
- nullif2: Anggap gender F null dan gender null tampilkan unknown
- mix_distinct_null_gagal: Daftar uniq brand, hitting yang email null(jika ada), jika email null ganti ‘no_email@unknown.com’. Hasilnya email tetap null


## 9_string
- string_substr: Ambil sebagian string / karakter, sesuai jumlah 1-8
- string_length: Hitung panjang string / karakter, terpajang
- string_upperlower: Ubah string jadi huru besar semua / kecil semua
- string_trimreplace: Hapus spasi dan ganti karakter string
- string_regexp:Cek string, apakah ada (true) / tidal ada (false)

## 10_datetime
- datetime_extract: ambit bagian tertentu dari tanggal
- datetime_datediff: hitung selisih dua tanggal, hari ini dan tanggal order
- datetime_addsub: tambahkan hari dan kurangi hari
- datetime_trunc: bulatkan tanggal ke awal periode (Year, Month, Day)

# datetime_quiz
- datetimequiz: ambil 5 transaksi terakhir(tampilkan tahun, bulan, hari), Hitung hari sejak transaksi pertama tiap customer, tampilkan awal bulan. 
—-notes: data tahun bulan hari masih terpisah.
- datetime_quiz_rev: Pakai TIMESTAMP agar tampilan tahun, bulan, hari jadi satu kolom. dan hitung hari pakai OVER(PARTITION BY))
- datetime_datediff_timestampdiff: perbandingan date_diff dan timestamp_diff
- datetime_quiz1: Gap transaksi hari pertama dan terakhir
- datetime_quiz1_rev: Gap transaksi hari terlama peruser. satu baris peruser
- datetime_trunc_quiz: Lihat jumlah transaksi user perbulan
- datetime_trunc_quiz1: nama customer, total order perbulan (semua cust), total order percust perbulan, tampilkan 5bulan dyngan order tertinggi.


## 11_union
- union_all: semua baris data digabung, termasuk duplikat.
- union_distinct: data unik dan menghapus duplikat
noted: di BigQuery, union = union distinct. 

# union_quiz
- union_all_quiz: tampilkan 10 nama customer, gender dan tanggal order. Urethan berdasarkan tanggal. Hasil 10 nama dan terlihat ada 2 duplikat
- union_distinct_quiz: tampilkan 10 nama customer, gender dan tanggal order. Urethan berdasarkan tanggal. Hasil 8 nama dan tanpa duplikat


## 12_except_intersect
- except:bagian dari A tidak ada di B atau sebaliknya
- intersect:ada A dan B
noted: di BigQuery, except = except distinct. intersect = intersect distinct

# except_intersect_quiz
- except_intersect_quiz: hitung jumlah customer loyal, baru dan hilang bulan september



### EVERY DAY QUIZ ###




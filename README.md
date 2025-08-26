# 🎨 Art Book Project  

📱 **ArtBookProject**, kullanıcıların kendi sanat koleksiyonlarını dijital ortamda saklamalarını sağlayan bir iOS uygulamasıdır.  
Kullanıcı, tabloya resim, sanatçı ismi ve yılı ekleyebilir; daha sonra kaydedilen eserleri listeleyebilir ve isterse silebilir.  

---

## ✨ Özellikler  

- 📂 **Core Data ile Kalıcı Veri Saklama**  
  - Kullanıcı uygulamayı kapatıp açsa bile eklenen tüm sanat eserleri kayıtlı kalır.  
  - `name`, `artist`, `year`, `id` ve `image` alanlarıyla tabloya kaydedilir.  

- 🖼 **Görsel Ekleme**  
  - Kullanıcı cihazının **fotoğraf kütüphanesinden** bir görsel seçebilir.  
  - Seçilen görsel, tabloya kaydedilir ve daha sonra listeden görülebilir.  
  - Görsel seçildiğinde **kırpma/düzenleme (allowsEditing)** özelliği aktif.  

- 📝 **Sanat Eseri Bilgileri Kaydetme**  
  - **Eser adı**, **sanatçı adı** ve **yıl** bilgileri kullanıcı tarafından girilir.  
  - Yıl bilgisi **Int** tipinde tutulur (string değil).  

- 📋 **Listeleme (UITableView)**  
  - Tüm kayıtlı eserler tablo halinde listelenir.  
  - Tablo hücrelerinde sadece **eser adı** gösterilir.  
  - Bir hücreye tıklanıldığında detay ekranına gidilir.  

- 🔍 **Detay Görüntüleme**  
  - Kullanıcı daha önce kaydedilen bir esere dokunduğunda, detay ekranında:  
    - Görsel  
    - Eser adı  
    - Sanatçı adı  
    - Yıl bilgisi  
  görüntülenir.  

- 🗑 **Silme İşlemi**  
  - Tablo üzerinden **swipe-to-delete** ile eser silinebilir.  
  - Hem **Core Data** kaydı hem de tabloda ilgili satır kaldırılır.  

- 🔔 **Veri Güncelleme**  
  - Yeni bir eser eklendiğinde **NotificationCenter** aracılığıyla liste ekranına bildirim gönderilir.  
  - Böylece kullanıcı ana ekrana döndüğünde tablo **otomatik olarak güncellenir**.  

- ⌨️ **Kullanıcı Dostu Klavye Yönetimi**  
  - Ekranın herhangi bir yerine dokunulduğunda klavye kapanır.  
  - Bu sayede kullanıcı, metin alanlarını doldurduktan sonra rahatça **Kaydet** butonuna erişebilir.  

- 🎨 **Basit ve Kullanışlı Arayüz**  
  - Navigation Bar üzerinden **➕ butonu** ile yeni eser eklenebilir.  
  - Tablodan seçilen öğeler detay ekranına taşınır.  
  - Kaydet butonu yalnızca görsel seçildiğinde aktif hale gelir.  

---

## 🛠 Kullanılan Teknolojiler  

- **Swift**  
- **UIKit**  
- **Core Data**  
- **Xcode**  


  


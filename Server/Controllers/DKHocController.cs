using DocumentFormat.OpenXml.Office2010.Excel;
using Flic.Server.Data;
using Flic.Server.Interfaces;
using Flic.Shared.Models;
using Microsoft.AspNetCore.Mvc;
using QRCoder;
using System.Text.RegularExpressions;

namespace Flic.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DKHocController : ControllerBase
    {
        private readonly IDKHoc _IDKHoc;
        readonly ApplicationDbContext _dbContext;
        private readonly IWebHostEnvironment env;
        private readonly IConfiguration _configuration;
        public VietQR qr;

        public DKHocController(IDKHoc dkhoc, ApplicationDbContext dbContext,
            IWebHostEnvironment env, IConfiguration configuration)
        {
            _IDKHoc = dkhoc;
            _dbContext = dbContext;
            this.env = env;
            _configuration = configuration;
            qr = new VietQR(
                _configuration["QR:payloadFormatIndicator"],
                _configuration["QR:pointOfInitiationMethod"],
                _configuration["QR:consumerAccountInformation"],
                _configuration["QR:transactionCurrency"],
                _configuration["QR:countryCode"]
            );
        }

        // GET: api/DKHoc/DKHocGetList
        [HttpGet("DKHocGetList")]
        public async Task<List<DKHoc>> DKHocGetList()
        {
            return await Task.FromResult(_IDKHoc.Get());
        }

        [HttpGet("DKHocGetListActive")]
        public async Task<List<DKHoc>> DKHocGetListActive()
        {
            return await Task.FromResult(_IDKHoc.GetActive());
        }

        [HttpGet("DKHocGetListByLoai/{loailop}")]
        public async Task<List<DKHoc>> DKHocGetListByLoai(string loailop)
        {
            List<string> LL = new List<string>(loailop.Split(";"));
            var list = _IDKHoc.GetActive().Where(m => m.CourseId != null && LL.Contains(m.CourseId.ToString())).ToList();
            return await Task.FromResult(list);
        }

        [HttpGet("DKHocGetListInActive")]
        public async Task<List<DKHoc>> DKHocGetListInActive()
        {
            return await Task.FromResult(_IDKHoc.GetInActive());
        }

        // GET api/DKHoc/DKHocGetByID/5
        [HttpGet("DKHocGetByID/{id}")]
        public IActionResult GetByID(int id)
        {
            DKHoc item = _IDKHoc.Get(id);
            if (item != null)
            {
                return Ok(item);
            }
            return NotFound();
        }

        public string LocDau(string str)
        {
            str = str.ToLower();
            str = Regex.Replace(str, "[àáạảãâầấậẩẫăằắặẳẵ]", "a");
            str = Regex.Replace(str, "[èéẹẻẽêềếệểễ]", "e");
            str = Regex.Replace(str, "[ìíịỉĩ]", "i");
            str = Regex.Replace(str, "[òóọỏõôồốộổỗơờớợởỡ]", "o");
            str = Regex.Replace(str, "[ùúụủũưừứựửữ]", "u");
            str = Regex.Replace(str, "[ỳýỵỷỹ]", "y");
            str = Regex.Replace(str, "đ", "d");
            str = str.Replace(",", "");
            str = str.Replace(".", "");
            return str.ToUpper();
        }

        [HttpGet("DKHocGetQRByID/{id}")]
        public IActionResult DKHocGetQRByID(int id)
        {
            DKHoc item = _IDKHoc.Get(id);

            if (item != null)
            {
                qr.setTransactionAmount(item.Hocphi.ToString());
                string hoten = LocDau(item.HovaDem + " " + item.Ten);
                string str = "TATC:" + item.MaSinhvien + "_" + hoten + "_" + item.LopID + "_" + item.DienThoai + "_" + item.Id.ToString();
                if (str.Length > 99) { str = str.Substring(0, 98); }
                qr.setPurposeOfTransaction(str);

                var qrContent = qr.buidQR();
                using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
                using (QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrContent, QRCodeGenerator.ECCLevel.Q))
                using (PngByteQRCode qrCode = new PngByteQRCode(qrCodeData))
                {
                    byte[] qrCodeImage = qrCode.GetGraphic(20);
                    var imageDataURL = $"data:image/png;base64,{Convert.ToBase64String(qrCodeImage)}";
                    return Ok(imageDataURL);
                }
            }
            return NotFound();
        }

        [HttpGet("DKHocGetByCCCD/{cccd}")]
        public IActionResult DKHocGetByCCCD(string cccd)
        {
            List<DKHoc> items = _IDKHoc.Get();
            if (items != null)
            {
                return Ok(items);
            }
            return NotFound();
        }

        [HttpGet("DKHocGetByMobile/{mobile}")]
        public IActionResult DKHocGetByMobile(string mobile)
        {
            List<DKHoc> list = _IDKHoc.GetByMobile(mobile);
            var _lophoc = _dbContext.Lophocs.ToList().Distinct().ToDictionary(x => x.Id, x => x.TenLop);
            if (list != null)
            {
                List<DKHocView> ls = new List<DKHocView>();
                foreach (var item in list)
                {
                    DKHocView rs = new DKHocView
                    {
                        Id = item.Id,
                        HovaDem = item.HovaDem,
                        Ten = item.Ten,
                        GioiTinh = item.GioiTinh,
                        DiaChi = item.DiaChi,
                        Email = item.Email,
                        DienThoai = item.DienThoai,
                        Trangthai = item.Trangthai,
                        NgayThanhtoan = item.NgayThanhtoan
                    };

                    if (item.CourseId != null && _lophoc.TryGetValue(item.CourseId, out string courseName))
                    {
                        rs.CourseName = courseName;
                    }
                    ls.Add(rs);
                }
                return Ok(ls);
            }
            return NotFound();
        }

        [HttpGet("DKHocGetByEmail/{email}")]
        public IActionResult DKHocGetByEmail(string email)
        {
            List<DKHoc> list = _IDKHoc.GetByEmail(email);
            var _lophoc = _dbContext.Lophocs.ToList().Distinct().ToDictionary(x => x.Id, x => x.TenLop);
            if (list != null)
            {
                List<DKHocView> ls = new List<DKHocView>();
                foreach (var item in list)
                {
                    DKHocView rs = new DKHocView
                    {
                        Id = item.Id,
                        HovaDem = item.HovaDem,
                        Ten = item.Ten,
                        GioiTinh = item.GioiTinh,
                        DiaChi = item.DiaChi,
                        Email = item.Email,
                        DienThoai = item.DienThoai,
                        Trangthai = item.Trangthai,
                        NgayThanhtoan = item.NgayThanhtoan
                    };

                    if (item.CourseId != null && _lophoc.TryGetValue(item.CourseId, out string courseName))
                    {
                        rs.CourseName = courseName;
                    }
                    ls.Add(rs);
                }
                return Ok(ls);
            }
            return NotFound();
        }

        [HttpPost("DKHocAdd")]
        public async Task<IActionResult> DKHocAdd(DKHoc item)
        {
            try
            {
                _IDKHoc.Add(item);
                return Ok(item);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPut("DKHocUpdate")]
        public IActionResult DKHocUpdate(DKHoc item)
        {
            try
            {
                _IDKHoc.Update(item);
                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpDelete("DKHocDelete/{id}")]
        public IActionResult DKHocDelete(int id)
        {
            try
            {
                _IDKHoc.Delete(id);
                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
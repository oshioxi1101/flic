﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flic.Shared.Models
{
    public class Nganh
    {
        [Key]        
        public string Id { get; set; }
        public string KhoaId { get; set; }
        public string Name { get; set; }
    }

}

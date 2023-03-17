using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CSPharma_v4._0_DAL.DataContexts;
using CSPharma_v4._0_DAL.Models;

namespace CSPharma_v4._0.Controllers
{
    public class LineasDistribucionController : Controller
    {
        private readonly CspharmaInformacionalContext _context;

        public LineasDistribucionController(CspharmaInformacionalContext context)
        {
            _context = context;
        }

        // GET: LineasDistribucion
        public async Task<IActionResult> Index()
        {
              return View(await _context.TdcCatLineasDistribucions.ToListAsync());
        }

        // GET: LineasDistribucion/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.TdcCatLineasDistribucions == null)
            {
                return NotFound();
            }

            var tdcCatLineasDistribucion = await _context.TdcCatLineasDistribucions
                .FirstOrDefaultAsync(m => m.CodLinea == id);
            if (tdcCatLineasDistribucion == null)
            {
                return NotFound();
            }

            return View(tdcCatLineasDistribucion);
        }

        // GET: LineasDistribucion/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: LineasDistribucion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CodLinea,MdUuid,MdDate,Id,CodProvincia,CodMunicipio,CodBarrio")] TdcCatLineasDistribucion tdcCatLineasDistribucion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tdcCatLineasDistribucion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tdcCatLineasDistribucion);
        }

        // GET: LineasDistribucion/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.TdcCatLineasDistribucions == null)
            {
                return NotFound();
            }

            var tdcCatLineasDistribucion = await _context.TdcCatLineasDistribucions.FindAsync(id);
            if (tdcCatLineasDistribucion == null)
            {
                return NotFound();
            }
            return View(tdcCatLineasDistribucion);
        }

        // POST: LineasDistribucion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("CodLinea,MdUuid,MdDate,Id,CodProvincia,CodMunicipio,CodBarrio")] TdcCatLineasDistribucion tdcCatLineasDistribucion)
        {
            if (id != tdcCatLineasDistribucion.CodLinea)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tdcCatLineasDistribucion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TdcCatLineasDistribucionExists(tdcCatLineasDistribucion.CodLinea))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(tdcCatLineasDistribucion);
        }

        // GET: LineasDistribucion/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.TdcCatLineasDistribucions == null)
            {
                return NotFound();
            }

            var tdcCatLineasDistribucion = await _context.TdcCatLineasDistribucions
                .FirstOrDefaultAsync(m => m.CodLinea == id);
            if (tdcCatLineasDistribucion == null)
            {
                return NotFound();
            }

            return View(tdcCatLineasDistribucion);
        }

        // POST: LineasDistribucion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.TdcCatLineasDistribucions == null)
            {
                return Problem("Entity set 'CspharmaInformacionalContext.TdcCatLineasDistribucions'  is null.");
            }
            var tdcCatLineasDistribucion = await _context.TdcCatLineasDistribucions.FindAsync(id);
            if (tdcCatLineasDistribucion != null)
            {
                _context.TdcCatLineasDistribucions.Remove(tdcCatLineasDistribucion);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TdcCatLineasDistribucionExists(string id)
        {
          return _context.TdcCatLineasDistribucions.Any(e => e.CodLinea == id);
        }
    }
}

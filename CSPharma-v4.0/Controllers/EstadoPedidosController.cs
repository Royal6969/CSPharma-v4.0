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
    public class EstadoPedidosController : Controller
    {
        private readonly CspharmaInformacionalContext _context;

        public EstadoPedidosController(CspharmaInformacionalContext context)
        {
            _context = context;
        }

        // GET: EstadoPedidos
        public async Task<IActionResult> Index()
        {
            var cspharmaInformacionalContext = _context.TdcTchEstadoPedidos.Include(t => t.CodEstadoDevolucionNavigation).Include(t => t.CodEstadoEnvioNavigation).Include(t => t.CodEstadoPagoNavigation).Include(t => t.CodLineaNavigation);
            return View(await cspharmaInformacionalContext.ToListAsync());
        }

        // GET: EstadoPedidos/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.TdcTchEstadoPedidos == null)
            {
                return NotFound();
            }

            var tdcTchEstadoPedidos = await _context.TdcTchEstadoPedidos
                .Include(t => t.CodEstadoDevolucionNavigation)
                .Include(t => t.CodEstadoEnvioNavigation)
                .Include(t => t.CodEstadoPagoNavigation)
                .Include(t => t.CodLineaNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tdcTchEstadoPedidos == null)
            {
                return NotFound();
            }

            return View(tdcTchEstadoPedidos);
        }

        // GET: EstadoPedidos/Create
        public IActionResult Create()
        {
            ViewData["CodEstadoDevolucion"] = new SelectList(_context.TdcCatEstadosDevolucionPedidos, "CodEstadoDevolucion", "CodEstadoDevolucion");
            ViewData["CodEstadoEnvio"] = new SelectList(_context.TdcCatEstadosEnvioPedidos, "CodEstadoEnvio", "CodEstadoEnvio");
            ViewData["CodEstadoPago"] = new SelectList(_context.TdcCatEstadosPagoPedidos, "CodEstadoPago", "CodEstadoPago");
            ViewData["CodLinea"] = new SelectList(_context.TdcCatLineasDistribucions, "CodLinea", "CodLinea");
            return View();
        }

        // POST: EstadoPedidos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,MdUuid,MdDate,CodPedido,CodEstadoEnvio,CodEstadoPago,CodEstadoDevolucion,CodLinea")] TdcTchEstadoPedidos tdcTchEstadoPedidos)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tdcTchEstadoPedidos);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CodEstadoDevolucion"] = new SelectList(_context.TdcCatEstadosDevolucionPedidos, "CodEstadoDevolucion", "CodEstadoDevolucion", tdcTchEstadoPedidos.CodEstadoDevolucion);
            ViewData["CodEstadoEnvio"] = new SelectList(_context.TdcCatEstadosEnvioPedidos, "CodEstadoEnvio", "CodEstadoEnvio", tdcTchEstadoPedidos.CodEstadoEnvio);
            ViewData["CodEstadoPago"] = new SelectList(_context.TdcCatEstadosPagoPedidos, "CodEstadoPago", "CodEstadoPago", tdcTchEstadoPedidos.CodEstadoPago);
            ViewData["CodLinea"] = new SelectList(_context.TdcCatLineasDistribucions, "CodLinea", "CodLinea", tdcTchEstadoPedidos.CodLinea);
            return View(tdcTchEstadoPedidos);
        }

        // GET: EstadoPedidos/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.TdcTchEstadoPedidos == null)
            {
                return NotFound();
            }

            var tdcTchEstadoPedidos = await _context.TdcTchEstadoPedidos.FindAsync(id);
            if (tdcTchEstadoPedidos == null)
            {
                return NotFound();
            }
            ViewData["CodEstadoDevolucion"] = new SelectList(_context.TdcCatEstadosDevolucionPedidos, "CodEstadoDevolucion", "CodEstadoDevolucion", tdcTchEstadoPedidos.CodEstadoDevolucion);
            ViewData["CodEstadoEnvio"] = new SelectList(_context.TdcCatEstadosEnvioPedidos, "CodEstadoEnvio", "CodEstadoEnvio", tdcTchEstadoPedidos.CodEstadoEnvio);
            ViewData["CodEstadoPago"] = new SelectList(_context.TdcCatEstadosPagoPedidos, "CodEstadoPago", "CodEstadoPago", tdcTchEstadoPedidos.CodEstadoPago);
            ViewData["CodLinea"] = new SelectList(_context.TdcCatLineasDistribucions, "CodLinea", "CodLinea", tdcTchEstadoPedidos.CodLinea);
            return View(tdcTchEstadoPedidos);
        }

        // POST: EstadoPedidos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,MdUuid,MdDate,CodPedido,CodEstadoEnvio,CodEstadoPago,CodEstadoDevolucion,CodLinea")] TdcTchEstadoPedidos tdcTchEstadoPedidos)
        {
            if (id != tdcTchEstadoPedidos.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tdcTchEstadoPedidos);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TdcTchEstadoPedidosExists(tdcTchEstadoPedidos.Id))
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
            ViewData["CodEstadoDevolucion"] = new SelectList(_context.TdcCatEstadosDevolucionPedidos, "CodEstadoDevolucion", "CodEstadoDevolucion", tdcTchEstadoPedidos.CodEstadoDevolucion);
            ViewData["CodEstadoEnvio"] = new SelectList(_context.TdcCatEstadosEnvioPedidos, "CodEstadoEnvio", "CodEstadoEnvio", tdcTchEstadoPedidos.CodEstadoEnvio);
            ViewData["CodEstadoPago"] = new SelectList(_context.TdcCatEstadosPagoPedidos, "CodEstadoPago", "CodEstadoPago", tdcTchEstadoPedidos.CodEstadoPago);
            ViewData["CodLinea"] = new SelectList(_context.TdcCatLineasDistribucions, "CodLinea", "CodLinea", tdcTchEstadoPedidos.CodLinea);
            return View(tdcTchEstadoPedidos);
        }

        // GET: EstadoPedidos/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.TdcTchEstadoPedidos == null)
            {
                return NotFound();
            }

            var tdcTchEstadoPedidos = await _context.TdcTchEstadoPedidos
                .Include(t => t.CodEstadoDevolucionNavigation)
                .Include(t => t.CodEstadoEnvioNavigation)
                .Include(t => t.CodEstadoPagoNavigation)
                .Include(t => t.CodLineaNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tdcTchEstadoPedidos == null)
            {
                return NotFound();
            }

            return View(tdcTchEstadoPedidos);
        }

        // POST: EstadoPedidos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.TdcTchEstadoPedidos == null)
            {
                return Problem("Entity set 'CspharmaInformacionalContext.TdcTchEstadoPedidos'  is null.");
            }
            var tdcTchEstadoPedidos = await _context.TdcTchEstadoPedidos.FindAsync(id);
            if (tdcTchEstadoPedidos != null)
            {
                _context.TdcTchEstadoPedidos.Remove(tdcTchEstadoPedidos);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TdcTchEstadoPedidosExists(int id)
        {
          return _context.TdcTchEstadoPedidos.Any(e => e.Id == id);
        }
    }
}

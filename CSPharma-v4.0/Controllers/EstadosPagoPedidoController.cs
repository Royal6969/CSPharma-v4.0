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
    public class EstadosPagoPedidoController : Controller
    {
        private readonly CspharmaInformacionalContext _context;

        public EstadosPagoPedidoController(CspharmaInformacionalContext context)
        {
            _context = context;
        }

        // GET: EstadosPagoPedido
        public async Task<IActionResult> Index()
        {
              return View(await _context.TdcCatEstadosPagoPedidos.ToListAsync());
        }

        // GET: EstadosPagoPedido/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.TdcCatEstadosPagoPedidos == null)
            {
                return NotFound();
            }

            var tdcCatEstadosPagoPedido = await _context.TdcCatEstadosPagoPedidos
                .FirstOrDefaultAsync(m => m.CodEstadoPago == id);
            if (tdcCatEstadosPagoPedido == null)
            {
                return NotFound();
            }

            return View(tdcCatEstadosPagoPedido);
        }

        // GET: EstadosPagoPedido/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: EstadosPagoPedido/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CodEstadoPago,MdUuid,MdDate,Id,DesEstadoPago")] TdcCatEstadosPagoPedido tdcCatEstadosPagoPedido)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tdcCatEstadosPagoPedido);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tdcCatEstadosPagoPedido);
        }

        // GET: EstadosPagoPedido/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.TdcCatEstadosPagoPedidos == null)
            {
                return NotFound();
            }

            var tdcCatEstadosPagoPedido = await _context.TdcCatEstadosPagoPedidos.FindAsync(id);
            if (tdcCatEstadosPagoPedido == null)
            {
                return NotFound();
            }
            return View(tdcCatEstadosPagoPedido);
        }

        // POST: EstadosPagoPedido/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("CodEstadoPago,MdUuid,MdDate,Id,DesEstadoPago")] TdcCatEstadosPagoPedido tdcCatEstadosPagoPedido)
        {
            if (id != tdcCatEstadosPagoPedido.CodEstadoPago)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tdcCatEstadosPagoPedido);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TdcCatEstadosPagoPedidoExists(tdcCatEstadosPagoPedido.CodEstadoPago))
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
            return View(tdcCatEstadosPagoPedido);
        }

        // GET: EstadosPagoPedido/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.TdcCatEstadosPagoPedidos == null)
            {
                return NotFound();
            }

            var tdcCatEstadosPagoPedido = await _context.TdcCatEstadosPagoPedidos
                .FirstOrDefaultAsync(m => m.CodEstadoPago == id);
            if (tdcCatEstadosPagoPedido == null)
            {
                return NotFound();
            }

            return View(tdcCatEstadosPagoPedido);
        }

        // POST: EstadosPagoPedido/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.TdcCatEstadosPagoPedidos == null)
            {
                return Problem("Entity set 'CspharmaInformacionalContext.TdcCatEstadosPagoPedidos'  is null.");
            }
            var tdcCatEstadosPagoPedido = await _context.TdcCatEstadosPagoPedidos.FindAsync(id);
            if (tdcCatEstadosPagoPedido != null)
            {
                _context.TdcCatEstadosPagoPedidos.Remove(tdcCatEstadosPagoPedido);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TdcCatEstadosPagoPedidoExists(string id)
        {
          return _context.TdcCatEstadosPagoPedidos.Any(e => e.CodEstadoPago == id);
        }
    }
}
